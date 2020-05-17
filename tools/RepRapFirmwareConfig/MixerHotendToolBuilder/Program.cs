using System;
using System.IO;
using System.Linq;
using System.Text;

namespace MixerHotendToolBuilder
{
    class Program
    {
        static void Main(string[] args)
        {
            var mixStates = 2;

            var drivers = new[] { 0, 1, 2 };
            int? heater = 1;
            int? fan = 0;
            var offsets = new { x = 0m, y = -19m, z = 0m, index = 0 };
            var temperatures = new { active = 0, standby = 0 };

            var template = new
            {
                input = "ToolTemplate.g",
                target = "<<DefinitionsHere>>",
                output = "Setup 3 Color"
            };

            // =MOD(INT((ROW()-2)/POWER(Mix_Steps,INDIRECT(ADDRESS(1,COLUMN())))),Mix_Steps)
            // ROW()-2 = mix index
            // INDIRECT(ADDRESS(1,COLUMN())) = extruder index

            var extruderCount = drivers.Length;
            var possibleMixes = (int)Math.Pow(mixStates, extruderCount);
            var format = new
            {
                weight = new string('X', (int)Math.Ceiling(Math.Log(mixStates, 16))),
                definitionSuffix = string.Join(' ', new[] {
                    drivers.Any() ? $"D{string.Join(':', drivers)}":null,
                    heater.HasValue ? $"H{heater}":null,
                    fan.HasValue ? $"F{fan}":null,
                }.Where(v => !string.IsNullOrWhiteSpace(v))),
            };

            var matrix = from mixIndex in Enumerable.Range(0, possibleMixes)
                         let weights = (from extruder in Enumerable.Range(0, extruderCount)
                                        select mixIndex / (int)Math.Pow(mixStates, extruder) % mixStates).ToArray()
                         let totalWeight = weights.Sum()
                         where totalWeight > 0
                         let mixes = (from w in weights
                                      select Math.Round((decimal)w / totalWeight, 2)).ToArray()
                         let configuration = $"E{string.Join(":", mixes.Select(v => v.ToString("0.00")))}"
                         let description = $"C{string.Join("", weights.Select(v => v.ToString(format.weight)))}"
                         group new
                         {
                             totalWeight,
                             Description = description,
                             Configuration = configuration,
                         } by configuration into possibleTools
                         let distinctTool = possibleTools.First()
                         orderby distinctTool.totalWeight, distinctTool.Description descending
                         select distinctTool;

            var tools = from t in matrix.Select((v, i) => new { Tool = v, ToolIndex = i + offsets.index })
                        select new[]
                        {
                            $"; Define Tool {t.ToolIndex}",
                            $@"M563 P{t.ToolIndex} S""{t.Tool.Description}"" {format.definitionSuffix}",
                            $"G10 P{t.ToolIndex} X{offsets.x} Y{offsets.y} Z{offsets.z} R{temperatures.active} S{temperatures.standby}",
                            $"M567 P{t.ToolIndex} {t.Tool.Configuration}",
                            "",
                        };
            var replacement = tools.SelectMany(l => l)
                                   .Aggregate(new StringBuilder(), (sb, l) => sb.AppendLine(l), sb => sb.ToString());

            var body = File.ReadAllText(template.input)
                           .Replace(template.target, replacement)
                           ;

            File.WriteAllText(template.output, body);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace DuetToolBuilder.Controllers
{
    public enum MainBoards
    {
        Duet3_6HC,
    }
    public class ToolModel
    {
        public MainBoards MainBoard { get; set; }
    }
    public class ToolsController : Controller
    {
        public IActionResult Index()
        {
            return View(new ToolModel
            {
                 MainBoard = MainBoards.Duet3_6HC,
            });
        }
    }
}
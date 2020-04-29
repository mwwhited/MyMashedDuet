import json
import sys

fileName = sys.argv[1]
print fileName
with open(fileName, "rw") as data_file:
	data = json.load(data_file)

	machine = data['machine']
	data['machine']['codes'] = []
	print json.dumps(machine,indent=4)

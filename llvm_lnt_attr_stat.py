import json
from pprint import pprint

with open('data.json') as f:
    data = json.load(f)

nounwind_attributor = 0
nounwind_functionattrs = 0

for key, value in data.items():
    if(key == "attributor.NumFnNoUnwind"):
        num = int(value)
        nounwind_attributor += num
    else if(key == "functionattrs.NumNoUnwind"):
        num = int(value)
        nounwind_functionattrs += num

print("attributor.NumFnNoUnwind: " + str(nounwind_attributor))
print("functionattrs.NumNoUnwind: " + str(nounwind_functionattrs))

pprint(data)

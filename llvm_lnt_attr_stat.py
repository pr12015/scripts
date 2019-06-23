import json, sys

nounwind_attributor = 0
nounwind_functionattrs = 0

with open(sys.argv[1]) as f:
    data = json.load(f)

    for key1, value1 in data.items():
        if key1 != 'tests':
            continue
        for test in value1:
            for key, value in test.items():
                if key != 'metrics':
                    continue
                for attr, strnum in value.items():
                    if attr.encode("ascii") == "attributor.NumFnNoUnwind":
                        num = float(strnum)
                        nounwind_attributor += num
                    elif(attr.encode("ascii") == "functionattrs.NumNoUnwind"):
                        num = float(strnum)
                        nounwind_functionattrs += num

print("attributor.NumFnNoUnwind: " + str(nounwind_attributor))
print("functionattrs.NumNoUnwind: " + str(nounwind_functionattrs))



import os

def replace_all(value: str, replacements: dict[str, str]):
    for key in replacements.keys():
        value = value.replace(key, replacements[key])
    return value

def replace_file(filename: str, replacements: dict[str, str]):
    target_filename = replace_all(filename, replacements)

    contents = ""
    with open(filename, "r") as file:
        contents = "".join(file.readlines())
    
    with open(target_filename, "w") as file:
        file.write(replace_all(contents, replacements))

entities = [
    "chicken",
    "cow",
    "pig",
    "cat",
    "wolf",
    "parrot",
    "donkey",
    "horse",
    "mule",
    "rabbit",
    "llama",
    "panda",
    "axolotl",
    "fox",
    "frog",
    "tropical_fish",
    "mooshroom",
    "shulker"
]


trims = [
    "bolt",
    "coast",
    "dune",
    "eye",
    "flow",
    "host",
    "raiser",
    "rib",
    "sentry",
    "shaper",
    "silence",
    "snout",
    "spire",
    "tide",
    "vex",
    "ward",
    "wayfinder",
    "wild",
]

for entity in entities:
    replace_file("C:/Users/caleb/AppData/Roaming/.minecraft/saves/Creative - 1_21_11/datapacks/FancyCombat/data/morecombat/function/functionality/wand/bolt/changes/_TYPE_.mcfunction", {"_TYPE_": entity})

# print("\n".join([replace_all("execute if predicate morecombat:wand/bolt/entity_check/_TYPE_ run function morecombat:functionality/wand/bolt/changes/_TYPE_", {"_TYPE_": x}) for x in entities]))



exit()

for trim in trims:
    replacements = {
        "_TRIM_": trim,
        "_TRIMPROPER_": trim.title(),
    }

    replace_file("C:/Users/caleb/AppData/Roaming/.minecraft/saves/Creative - 1_21_11/datapacks/FancyCombat/data/morecombat/loot_table/wand/_TRIM_.json", replacements)





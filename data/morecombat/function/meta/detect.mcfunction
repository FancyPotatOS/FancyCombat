
execute unless score $version.morecombat fpconflict.conflict_map matches 2 run tellraw @a ["",{"text":"[Conflict]","color":"red"}," - ",{"text":"More Combat Datapack ","color":"blue"},"(",{"text":"Overlapping versions.","italic":true,"color":"dark_aqua"},")"]

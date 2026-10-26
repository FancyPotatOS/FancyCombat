
execute if predicate {"value":{"type":"minecraft:uniform","min":1,"max":1000000000},"type":"minecraft:int_value_check","test":{"min":1,"max":{"type":"minecraft:score","target":{"type":"minecraft:fixed","name":"$chance"},"score":"morecombat.temp","fallback":0}}} run scoreboard players add $out morecombat.temp 1
scoreboard players remove $_trials morecombat.temp 1
execute if score $_trials morecombat.temp matches 1.. run function morecombat:random/binomial_loop

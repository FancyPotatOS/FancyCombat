
execute if predicate {"condition":"minecraft:value_check","value":{"min":1,"max":1000000000},"range":{"min":1,"max":{"type":"minecraft:score","score":"morecombat.temp","target":{"type":"minecraft:fixed","name":"$chance"}}}} run scoreboard players add $out morecombat.temp 1
scoreboard players remove $_trials morecombat.temp 1
execute if score $_trials morecombat.temp matches 1.. run function morecombat:random/binomial_loop

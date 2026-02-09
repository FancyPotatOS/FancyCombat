

execute if block ~ ~ ~ #morecombat:wand/flow/air_like if blocks ~ ~ ~ ~ ~3 ~ ~ ~1 ~ all positioned ~ ~4 ~ run return run function morecombat:functionality/wand/flow/summon_item_spawner
execute if block ~ ~ ~ #morecombat:wand/flow/air_like if blocks ~ ~ ~ ~ ~2 ~ ~ ~1 ~ all positioned ~ ~3 ~ run return run function morecombat:functionality/wand/flow/summon_item_spawner
execute if block ~ ~ ~ #morecombat:wand/flow/air_like if blocks ~ ~ ~ ~ ~1 ~ ~ ~1 ~ all positioned ~ ~2 ~ run return run function morecombat:functionality/wand/flow/summon_item_spawner

execute positioned ~ ~1 ~ run function morecombat:functionality/wand/flow/summon_item_spawner




execute as @e[type=#morecombat:wand/flow/can_be_targeted,sort=nearest,limit=10,distance=..15] run tag @s add morecombat.wand.flow.target

execute unless entity @e[tag=morecombat.wand.flow.target] run return run function morecombat:functionality/wand/flow/fail/no_target

execute as @e[tag=morecombat.wand.flow.target] at @s align xyz positioned ~0.5 ~0.5 ~0.5 run function morecombat:functionality/wand/flow/create_spawner

tag @e[tag=morecombat.wand.flow.target] remove morecombat.wand.flow.target


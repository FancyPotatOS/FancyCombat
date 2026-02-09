

tag @s add morecombat.wand.rib.activator
execute anchored eyes positioned ^ ^ ^0.5 rotated as @s summon minecraft:wither_skull positioned 0.0 0 0.0 positioned ^ ^ ^0.3 run function morecombat:functionality/wand/rib/blue/init_skull
tag @s remove morecombat.wand.rib.activator

playsound minecraft:entity.wither.shoot player @a[distance=..20] ~ ~ ~ 1 1.5


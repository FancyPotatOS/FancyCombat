

tag @s add morecombat.wand.snout.activator
execute anchored eyes positioned ^ ^ ^0.5 rotated as @s summon minecraft:fireball positioned 0.0 0 0.0 positioned ^ ^ ^0.5 run function morecombat:functionality/wand/snout/ghast/init_fireball
tag @s remove morecombat.wand.snout.activator

playsound minecraft:entity.blaze.shoot player @a[distance=..20] ~ ~ ~ 1 1.5



playsound minecraft:entity.generic.small_fall player @a[distance=..30] ~ ~ ~ 1 1.5
playsound minecraft:block.bone_block.break player @a[distance=..30] ~ ~ ~ 1 0.2

execute store result entity @s Motion[0] double -1 run data get entity @s Motion[0]
execute store result entity @s Motion[1] double -1 run data get entity @s Motion[1]
execute store result entity @s Motion[2] double -1 run data get entity @s Motion[2]

tag @s add morecombat.wand.sentry.projectile.reflected


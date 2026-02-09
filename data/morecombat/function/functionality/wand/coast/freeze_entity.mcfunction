

playsound minecraft:entity.generic.small_fall player @a[distance=..30] ~ ~ ~ 1 1.5
playsound block.glass.break player @a[distance=..30] ~ ~ ~ 1 0.2

# Apply effect duration
scoreboard players operation @s morecombat.wand.coast.effect_duration = $wand.coast.effect_duration morecombat.config
data modify storage morecombat:data macro set value {"min":0,"max":0}
execute store result storage morecombat:data macro.max int 1 run scoreboard players get $wand.coast.effect_delta morecombat.config
function morecombat:macro/rng with storage morecombat:data macro
scoreboard players operation @s morecombat.wand.coast.effect_duration += $rng morecombat.temp

tag @s add morecombat.wand.coast.frozen
fill ~-1 ~-1 ~-1 ~1 ~2 ~1 minecraft:ice replace water[level=0]
fill ~ ~ ~ ~ ~1 ~ water[level=0] replace minecraft:ice

execute as @n[tag=morecombat.wand.coast.frozen.new] run function morecombat:functionality/wand/coast/grant_immunity
tag @n[tag=morecombat.wand.coast.frozen.new] remove morecombat.wand.coast.frozen.new



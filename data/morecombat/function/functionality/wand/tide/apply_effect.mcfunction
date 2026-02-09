

# Apply effect duration
scoreboard players operation @s morecombat.wand.tide.effect_duration = $wand.tide.effect_duration morecombat.config
data modify storage morecombat:data macro set value {"min":0,"max":0}
execute store result storage morecombat:data macro.max int 1 run scoreboard players get $wand.tide.effect_delta morecombat.config
function morecombat:macro/rng with storage morecombat:data macro
scoreboard players operation @s morecombat.wand.tide.effect_duration += $rng morecombat.temp
tag @s add morecombat.wand.tide.active

attribute @s minecraft:submerged_mining_speed modifier add morecombat:wand.tide 0.4 add_value
attribute @s minecraft:water_movement_efficiency modifier add morecombat:wand.tide 0.8 add_value
attribute @s minecraft:burning_time modifier add morecombat:wand.tide -1 add_value
attribute @s minecraft:oxygen_bonus modifier add morecombat:wand.tide 4 add_value

tag @s add morecombat.wand.tide.active


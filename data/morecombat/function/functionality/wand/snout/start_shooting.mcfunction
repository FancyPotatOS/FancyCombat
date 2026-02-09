

tag @s add morecombat.wand.snout.shooting

# Apply effect duration
scoreboard players operation @s morecombat.wand.snout.effect_duration = $wand.snout.shoot_duration morecombat.config
data modify storage morecombat:data macro set value {"min":0,"max":0}
execute store result storage morecombat:data macro.max int 1 run scoreboard players get $wand.snout.shoot_delta morecombat.config
function morecombat:macro/rng with storage morecombat:data macro
scoreboard players operation @s morecombat.wand.snout.effect_duration += $rng morecombat.temp




# Apply tags
tag @s add morecombat.wand.coast.marker

# Apply lifetime
scoreboard players operation @s morecombat.wand.coast.lifetime = $wand.coast.base_lifetime morecombat.config
data modify storage morecombat:data macro set value {"min":0,"max":0}
execute store result storage morecombat:data macro.max int 1 run scoreboard players get $wand.coast.lifetime_delta morecombat.config
function morecombat:macro/rng with storage morecombat:data macro
scoreboard players operation @s morecombat.wand.coast.lifetime += $rng morecombat.temp


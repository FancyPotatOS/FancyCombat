

# Apply tags
tag @s add morecombat.wand.sentry.marker

# Apply lifetime
scoreboard players operation @s morecombat.wand.sentry.lifetime = $wand.sentry.base_lifetime morecombat.config
data modify storage morecombat:data macro set value {"min":0,"max":0}
execute store result storage morecombat:data macro.max int 1 run scoreboard players get $wand.sentry.lifetime_delta morecombat.config
function morecombat:macro/rng with storage morecombat:data macro
scoreboard players operation @s morecombat.wand.sentry.lifetime += $rng morecombat.temp


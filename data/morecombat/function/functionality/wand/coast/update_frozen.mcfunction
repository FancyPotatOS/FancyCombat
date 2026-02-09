

# Lifetime check
scoreboard players remove @s morecombat.wand.coast.effect_duration 1
execute if score @s morecombat.wand.coast.effect_duration matches 1.. run return 0

fill ~-1 ~-1 ~-1 ~1 ~2 ~1 water[level=0] replace minecraft:ice
kill @s


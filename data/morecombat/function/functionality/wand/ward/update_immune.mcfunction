

# Immune time check
scoreboard players remove @s morecombat.wand.ward.immune_time 1
execute if score @s morecombat.wand.ward.immune_time matches 1.. run return 0

tag @s remove morecombat.wand.ward.sculk_immune


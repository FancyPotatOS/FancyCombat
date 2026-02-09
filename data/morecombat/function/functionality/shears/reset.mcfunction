#
#   Shears Ability Set
#   
#   Purpose: To remove the reduced block interaction range
#
#   Input: None
#


attribute @s minecraft:block_interaction_range modifier remove morecombat.shears.block_interaction_range

particle minecraft:dust_color_transition{from_color:[0.7, 0.7, 1],to_color:[1, 0.7, 0.5],scale:0.5} ~ ~1 ~ 0.3 0.5 0.3 0.5 10
playsound minecraft:block.bubble_column.bubble_pop master @a[distance=..30] ~ ~ ~ 1 0.1

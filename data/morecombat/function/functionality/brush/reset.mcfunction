#
#   Brush Ability Reset
#   
#   Purpose: To remove the reduced block interaction range
#
#   Input: None
#


attribute @s minecraft:entity_interaction_range modifier remove morecombat.brush.entity_interaction_range

particle minecraft:dust_color_transition{from_color:[1, 1, 0.7],to_color:[1, 0.9, 0.9],scale:0.9} ~ ~1 ~ 0.3 0.5 0.3 0.5 10
playsound minecraft:block.beehive.drip master @a[distance=..30] ~ ~ ~ 1 1.9

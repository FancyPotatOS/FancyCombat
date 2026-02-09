#
#   Brush Ability Set
#   
#   Purpose: To set the brush cooldown and reduced block interaction range
#
#   Input: None
#


scoreboard players operation @s morecombat.brush_cooldown = config.brush_cooldown morecombat.master

attribute @s minecraft:entity_interaction_range modifier add morecombat.brush.entity_interaction_range -1.5 add_value
particle minecraft:dust_color_transition{from_color:[1, 1, 1],to_color:[1, 0.8, 0.8],scale:0.5} ~ ~1 ~ 0.3 0.5 0.3 0.5 20

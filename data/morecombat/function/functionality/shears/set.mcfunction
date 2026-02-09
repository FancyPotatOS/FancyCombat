#
#   Shears Ability Set
#   
#   Purpose: To set the Shears cooldown and reduced block interaction range
#
#   Input: None
#


scoreboard players operation @s morecombat.shears_cooldown = config.shears_cooldown morecombat.master

attribute @s minecraft:block_interaction_range modifier add morecombat.shears.block_interaction_range -1.5 add_value
particle minecraft:dust_color_transition{from_color:[0, 0, 0.7],to_color:[1, 0.5, 0],scale:0.5} ~ ~1 ~ 0.3 0.5 0.3 0.5 20

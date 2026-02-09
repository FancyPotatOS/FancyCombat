#
#   Meta Tick
#   
#   Purpose: To update all information that needs to be updated every tick
#
#   Input: None
#


scoreboard players remove @a morecombat.shears_cooldown 1
execute as @a at @s if score @s morecombat.shears_cooldown matches 1 run function morecombat:functionality/shears/reset

scoreboard players remove @a morecombat.brush_cooldown 1
execute as @a at @s if score @s morecombat.brush_cooldown matches 1 run function morecombat:functionality/brush/reset


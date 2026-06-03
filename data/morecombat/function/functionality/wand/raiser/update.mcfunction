

tag @s add morecombat.wand.raiser.user
execute as @e[type=item,distance=..15] at @s run function morecombat:functionality/wand/raiser/item_update
tag @s remove morecombat.wand.raiser.user

scoreboard players remove @s morecombat.wand.raiser.effect_duration 1
execute if score @s morecombat.wand.raiser.effect_duration matches ..0 run function morecombat:functionality/wand/raiser/deactivate




# Lifetime check
scoreboard players remove @s morecombat.wand.ward.lifetime 1
execute if score @s morecombat.wand.ward.lifetime matches ..0 run return run tag @s remove morecombat.wand.ward.sculking

execute if predicate morecombat:wand/ward/noise_chance run playsound block.sculk_sensor.clicking_stop player @a[distance=..40] ~ ~ ~ 1 0.5

tag @s add morecombat.wand.ward.listener
execute as @e[type=#morecombat:wand/ward/makes_noise,distance=0.1..40,predicate=morecombat:wand/ward/making_noise,tag=!morecombat.wand.ward.sculk_immune] at @s run function morecombat:functionality/wand/ward/made_noise
tag @s remove morecombat.wand.ward.listener


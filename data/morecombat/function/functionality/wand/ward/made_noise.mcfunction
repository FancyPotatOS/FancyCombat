

scoreboard players operation @s morecombat.wand.ward.immune_time = $wand.ward.immune_time morecombat.config
tag @s add morecombat.wand.ward.sculk_immune

data modify storage morecombat:data macro set value {x:0,y:0,z:0}
execute store result storage morecombat:data macro.x int 1 run data get entity @s Pos[0]
execute store result storage morecombat:data macro.y int 1 run data get entity @s Pos[1]
execute store result storage morecombat:data macro.z int 1 run data get entity @s Pos[2]

playsound minecraft:block.sculk_sensor.clicking_stop player @p[tag=morecombat.wand.ward.listener] ~ ~ ~ 1000 0.7 1
execute at @n[tag=morecombat.wand.ward.listener] run playsound minecraft:block.sculk_sensor.clicking player @a[distance=0.1..40] ~ ~ ~ 1 1
execute as @n[tag=morecombat.wand.ward.listener] at @s run playsound minecraft:block.sculk_sensor.clicking player @s ~ ~ ~ 0.3 1
execute at @n[tag=morecombat.wand.ward.listener] run function morecombat:functionality/wand/ward/create_vibration with storage morecombat:data macro


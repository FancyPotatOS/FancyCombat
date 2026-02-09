

playsound minecraft:entity.generic.burn player @a[distance=..15] ~ ~ ~ 0.1 1.8

scoreboard players operation $temp morecombat.temp = @s morecombat.wand.cooldown.advanced

scoreboard players operation $temp morecombat.temp -= @s morecombat.play_time
scoreboard players add $temp morecombat.temp 20
execute store result storage morecombat:data cooldown int 0.05 run scoreboard players get $temp morecombat.temp

title @s actionbar [{text: "Cooldown: ", color: white}, {"nbt":"cooldown","storage":"morecombat:data"}, {text:"s"}]
title @s title ''


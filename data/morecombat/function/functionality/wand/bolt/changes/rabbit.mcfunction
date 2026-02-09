
execute store result score $temp morecombat.temp run data get entity @s RabbitType

scoreboard players add $temp morecombat.temp 1
scoreboard players set $mod morecombat.temp 6

scoreboard players operation $temp morecombat.temp %= $mod morecombat.temp

execute store result entity @s RabbitType int 1 run scoreboard players get $temp morecombat.temp

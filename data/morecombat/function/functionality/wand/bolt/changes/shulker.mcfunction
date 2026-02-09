
execute store result score $temp morecombat.temp run data get entity @s Color

scoreboard players add $temp morecombat.temp 1
scoreboard players set $mod morecombat.temp 17

scoreboard players operation $temp morecombat.temp %= $mod morecombat.temp

execute store result entity @s Color int 1 run scoreboard players get $temp morecombat.temp

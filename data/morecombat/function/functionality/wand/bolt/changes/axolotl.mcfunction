
execute store result score $temp morecombat.temp run data get entity @s Variant

scoreboard players add $temp morecombat.temp 1
scoreboard players set $mod morecombat.temp 5

scoreboard players operation $temp morecombat.temp %= $mod morecombat.temp

execute store result entity @s Variant int 1 run scoreboard players get $temp morecombat.temp

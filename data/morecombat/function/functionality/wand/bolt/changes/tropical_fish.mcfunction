
# Reset
scoreboard players set $variant morecombat.temp 0

execute store result score $current morecombat.temp run random value 0..15
scoreboard players set $scale morecombat.temp 16777216
scoreboard players operation $current morecombat.temp *= $scale morecombat.temp
scoreboard players operation $variant morecombat.temp += $current morecombat.temp

execute store result score $current morecombat.temp run random value 0..15
scoreboard players set $scale morecombat.temp 65536
scoreboard players operation $current morecombat.temp *= $scale morecombat.temp
scoreboard players operation $variant morecombat.temp += $current morecombat.temp

execute store result score $current morecombat.temp run random value 0..5
scoreboard players set $scale morecombat.temp 256
scoreboard players operation $current morecombat.temp *= $scale morecombat.temp
scoreboard players operation $variant morecombat.temp += $current morecombat.temp

execute store result score $current morecombat.temp run random value 0..1
scoreboard players operation $variant morecombat.temp += $current morecombat.temp

execute store result entity @s Variant int 1 run scoreboard players get $variant morecombat.temp

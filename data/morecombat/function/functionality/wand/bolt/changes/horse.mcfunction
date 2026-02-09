
execute store result score $color morecombat.temp run random value 0..6

execute store result score $markings morecombat.temp run random value 0..4
scoreboard players add $markings morecombat.temp 1
scoreboard players set $scale morecombat.temp 256
scoreboard players operation $markings morecombat.temp *= $scale morecombat.temp

# Combine
scoreboard players operation $markings morecombat.temp += $color morecombat.temp

execute store result entity @s Variant int 1 run scoreboard players get $markings morecombat.temp

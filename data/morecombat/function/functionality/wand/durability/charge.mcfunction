
# Expectation: score `$cost morecombat.temp` set to durabilty charge

scoreboard players set $unbreaking morecombat.temp 0
execute if data entity @s SelectedItem.components."minecraft:enchantments"."minecraft:unbreaking" store result score $unbreaking morecombat.temp run data get entity @s SelectedItem.components."minecraft:enchantments"."minecraft:unbreaking"
scoreboard players add $unbreaking morecombat.temp 1

scoreboard players operation $trials morecombat.temp = $cost morecombat.temp
scoreboard players set $chance morecombat.temp 1000000000
scoreboard players operation $chance morecombat.temp /= $unbreaking morecombat.temp
function morecombat:random/binomial

execute if score $out morecombat.temp matches 0 run return 0

scoreboard players operation $cost morecombat.temp = $out morecombat.temp

scoreboard players set $-1 morecombat.temp -1
scoreboard players operation $cost morecombat.temp *= $-1 morecombat.temp
item modify entity @s weapon.mainhand morecombat:wand/durability/charge


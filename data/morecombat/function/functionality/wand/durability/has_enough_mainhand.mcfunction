
# Expectation: score `$cost morecombat.temp` set to durabilty charge

scoreboard players set $max_damage morecombat.temp 0
execute store result score $max_damage morecombat.temp run data get entity @s SelectedItem.components.minecraft:max_damage
scoreboard players set $damage morecombat.temp 0
execute store result score $damage morecombat.temp run data get entity @s SelectedItem.components.minecraft:damage

return run function morecombat:functionality/wand/durability/has_enough


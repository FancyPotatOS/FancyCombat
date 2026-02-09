
execute if data entity @s {variant:"minecraft:cold"} run return run data modify entity @s variant set value "minecraft:temperate"
execute if data entity @s {variant:"minecraft:temperate"} run return run data modify entity @s variant set value "minecraft:warm"
execute if data entity @s {variant:"minecraft:warm"} run return run data modify entity @s variant set value "minecraft:cold"

#
#   Hoe Item Setup
#   
#   Purpose: To setup the held hoe
#
#   Input: None
#


execute if data entity @s SelectedItem{id:"minecraft:wooden_hoe"} run item modify entity @s weapon.mainhand morecombat:set_base/hoe/wooden_golden
execute if data entity @s SelectedItem{id:"minecraft:golden_hoe"} run item modify entity @s weapon.mainhand morecombat:set_base/hoe/wooden_golden

execute if data entity @s SelectedItem{id:"minecraft:stone_hoe"} run item modify entity @s weapon.mainhand morecombat:set_base/hoe/stone

execute if data entity @s SelectedItem{id:"minecraft:copper_hoe"} run item modify entity @s weapon.mainhand morecombat:set_base/hoe/copper

execute if data entity @s SelectedItem{id:"minecraft:iron_hoe"} run item modify entity @s weapon.mainhand morecombat:set_base/hoe/iron

execute if data entity @s SelectedItem{id:"minecraft:diamond_hoe"} run item modify entity @s weapon.mainhand morecombat:set_base/hoe/diamond

execute if data entity @s SelectedItem{id:"minecraft:netherite_hoe"} run item modify entity @s weapon.mainhand morecombat:set_base/hoe/netherite

#item modify entity @s weapon.mainhand morecombat:set_base/tools/hoe
    
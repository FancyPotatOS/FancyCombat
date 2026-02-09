#
#   Axe Item Setup
#   
#   Purpose: To setup the held axe
#
#   Input: None
#


execute if data entity @s SelectedItem{id:"minecraft:wooden_axe"} run item modify entity @s weapon.mainhand morecombat:set_base/axe/wooden

execute if data entity @s SelectedItem{id:"minecraft:stone_axe"} run item modify entity @s weapon.mainhand morecombat:set_base/axe/stone

execute if data entity @s SelectedItem{id:"minecraft:copper_axe"} run item modify entity @s weapon.mainhand morecombat:set_base/axe/copper

execute if data entity @s SelectedItem{id:"minecraft:golden_axe"} run item modify entity @s weapon.mainhand morecombat:set_base/axe/golden

execute if data entity @s SelectedItem{id:"minecraft:iron_axe"} run item modify entity @s weapon.mainhand morecombat:set_base/axe/iron

execute if data entity @s SelectedItem{id:"minecraft:diamond_axe"} run item modify entity @s weapon.mainhand morecombat:set_base/axe/diamond

execute if data entity @s SelectedItem{id:"minecraft:netherite_axe"} run item modify entity @s weapon.mainhand morecombat:set_base/axe/netherite

#item modify entity @s weapon.mainhand morecombat:set_base/tools/axe
    
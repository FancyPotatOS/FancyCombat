#
#   Other (Misc.) Item Setup
#   
#   Purpose: To setup the held miscellaneous tool
#
#   Input: None
#



execute if data entity @s SelectedItem{id:"minecraft:trident"} run item modify entity @s weapon.mainhand morecombat:set_base/tools/trident

execute if data entity @s SelectedItem{id:"minecraft:shears"} run item modify entity @s weapon.mainhand morecombat:set_base/tools/shears

execute if data entity @s SelectedItem{id:"minecraft:brush"} run item modify entity @s weapon.mainhand morecombat:set_base/tools/brush


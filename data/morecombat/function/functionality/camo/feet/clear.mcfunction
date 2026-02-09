

summon item ~ ~ ~ {Age:1,Tags:["morecombat.camo.temp_item"],Item:{count:1,id:"minecraft:stone"}}
data modify entity @n[tag=morecombat.camo.temp_item] Item set from entity @s equipment.feet
data modify entity @n[tag=morecombat.camo.temp_item] Item.components.minecraft:equippable.asset_id set value "morecombat:camo/none_feet"

item replace entity @s armor.feet from entity @n[tag=morecombat.camo.temp_item] contents

kill @n[tag=morecombat.camo.temp_item]


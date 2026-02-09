

summon item ~ ~ ~ {Age:1,Tags:["morecombat.camo.temp_item"],Item:{count:1,id:"minecraft:stone"}}
data modify entity @n[tag=morecombat.camo.temp_item] Item set from entity @s equipment.head
data modify entity @n[tag=morecombat.camo.temp_item] Item.components.minecraft:equippable.asset_id set value "morecombat:camo/none_head"

item replace entity @s armor.head from entity @n[tag=morecombat.camo.temp_item] contents

kill @n[tag=morecombat.camo.temp_item]


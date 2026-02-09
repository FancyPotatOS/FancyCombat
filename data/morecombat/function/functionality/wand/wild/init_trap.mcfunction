

tag @s add morecombat.wand.wild.trap
scoreboard players operation @s morecombat.id = @n[tag=morecombat.wand.wild.activator] morecombat.id

data modify entity @s data.owner set from entity @n[tag=morecombat.wand.wild.activator] UUID
data modify entity @s data.item set from entity @n[tag=morecombat.wand.wild.activator] equipment.offhand
data modify entity @s data.item.count set value 1

scoreboard players operation @s morecombat.wand.wild.grace_period = $wand.wild.grace_period morecombat.config 

item modify entity @n[tag=morecombat.wand.wild.activator] weapon.offhand morecombat:reduce_item_count




tag @s add morecombat.wand.dune.trap
scoreboard players operation @s morecombat.id = @n[tag=morecombat.wand.dune.activator] morecombat.id

data modify entity @s data.owner set from entity @n[tag=morecombat.wand.dune.activator] UUID
data modify entity @s data.item set from entity @n[tag=morecombat.wand.dune.activator] equipment.offhand
data modify entity @s data.item.count set value 1

scoreboard players operation @s morecombat.wand.dune.grace_period = $wand.dune.grace_period morecombat.config 

item modify entity @n[tag=morecombat.wand.dune.activator] weapon.offhand morecombat:reduce_item_count


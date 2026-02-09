

tag @s add morecombat.wand.shaper.trap
scoreboard players operation @s morecombat.id = @n[tag=morecombat.wand.shaper.activator] morecombat.id

scoreboard players operation @s morecombat.wand.shaper.grace_period = $wand.shaper.grace_period morecombat.config 

item modify entity @n[tag=morecombat.wand.shaper.activator] weapon.offhand morecombat:reduce_item_count


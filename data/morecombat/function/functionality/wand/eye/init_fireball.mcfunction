

data modify entity @s Owner set from entity @n[tag=morecombat.wand.eye.activator] UUID

tag @s add morecombat.wand.eye.fireball
execute summon area_effect_cloud run function morecombat:functionality/wand/eye/init_aec
tag @s remove morecombat.wand.eye.fireball


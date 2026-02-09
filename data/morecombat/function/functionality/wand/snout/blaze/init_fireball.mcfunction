

data modify entity @s Owner set from entity @n[tag=morecombat.wand.snout.activator] UUID

tag @s add morecombat.wand.snout.fireball
execute summon area_effect_cloud run function morecombat:functionality/wand/snout/blaze/init_aec
tag @s remove morecombat.wand.snout.fireball


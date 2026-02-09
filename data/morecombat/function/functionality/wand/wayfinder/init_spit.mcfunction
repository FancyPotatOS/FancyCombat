

data modify entity @s Owner set from entity @n[tag=morecombat.wand.wayfinder.activator] UUID

tag @s add morecombat.wand.wayfinder.spit
execute summon area_effect_cloud run function morecombat:functionality/wand/wayfinder/init_aec
tag @s remove morecombat.wand.wayfinder.spit


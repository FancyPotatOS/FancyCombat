

data modify entity @s Owner set from entity @n[tag=morecombat.wand.rib.activator] UUID
data modify entity @s dangerous set value true

tag @s add morecombat.wand.rib.skull
execute summon area_effect_cloud run function morecombat:functionality/wand/rib/blue/init_aec
tag @s remove morecombat.wand.rib.skull


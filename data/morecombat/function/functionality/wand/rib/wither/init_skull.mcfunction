

data modify entity @s Owner set from entity @n[tag=morecombat.wand.rib.activator] UUID
data modify entity @s dangerous set value false
data modify entity @s acceleration_power set value 0.1d

tag @s add morecombat.wand.rib.skull
execute summon area_effect_cloud run function morecombat:functionality/wand/rib/wither/init_aec
tag @s remove morecombat.wand.rib.skull


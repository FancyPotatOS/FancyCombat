

data modify entity @s Owner set from entity @n[tag=morecombat.wand.spire.activator] UUID
data modify entity @s Steps set value 1

say @n[type=#morecombat:wand/spire/can_be_attacked,tag=!morecombat.wand.spire.activator]
data modify entity @s Target set from entity @n[type=#morecombat:wand/spire/can_be_attacked,tag=!morecombat.wand.spire.activator] UUID
data modify entity @s Target set from entity @p[tag=!morecombat.wand.spire.activator,limit=1,sort=nearest] UUID


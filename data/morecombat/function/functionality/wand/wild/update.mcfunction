

scoreboard players remove @s morecombat.wand.wild.grace_period 1
execute if score @s morecombat.wand.wild.grace_period matches ..0 run scoreboard players set @s morecombat.id -1

execute unless entity @s[tag=morecombat.wand.wild.trap.buried] unless block ~ ~ ~ #morecombat:wand/wild/air_like run function morecombat:functionality/wand/wild/buried

execute if entity @s[tag=morecombat.wand.wild.trap.buried] run return run function morecombat:functionality/wand/wild/buried_update

particle minecraft:ash ~ ~0.05 ~ 0.2 0 0.2 0 1

# Get one entity that's activating the trap
tag @s add morecombat.wand.wild.update.marker
execute \
    positioned ~-0.5 ~ ~-0.5 \
    as @e[type=#morecombat:wand/wild/can_activate_traps,dx=0,dy=0,dz=0] \
    unless score @s morecombat.id = @n[tag=morecombat.wand.wild.update.marker] morecombat.id \
    run tag @s add morecombat.wand.wild.triggeredmany

# Tag cleanup
tag @s remove morecombat.wand.wild.update.marker
tag @e[tag=morecombat.wand.wild.triggeredmany,limit=1] add morecombat.wand.wild.triggered
tag @e[tag=morecombat.wand.wild.triggeredmany] remove morecombat.wand.wild.triggeredmany

# If found a triggering target, get direction and start
execute if entity @n[tag=morecombat.wand.wild.triggered] run function morecombat:functionality/wand/wild/direction/choose

# More tag cleanup
tag @e[tag=morecombat.wand.wild.triggered] remove morecombat.wand.wild.triggered


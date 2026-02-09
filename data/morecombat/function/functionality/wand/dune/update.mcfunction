

scoreboard players remove @s morecombat.wand.dune.grace_period 1
execute if score @s morecombat.wand.dune.grace_period matches ..0 run scoreboard players set @s morecombat.id -1

execute unless entity @s[tag=morecombat.wand.dune.trap.buried] unless block ~ ~ ~ #morecombat:wand/dune/air_like run function morecombat:functionality/wand/dune/buried

execute if entity @s[tag=morecombat.wand.dune.trap.buried] run return run function morecombat:functionality/wand/dune/buried_update

particle minecraft:ash ~ ~0.05 ~ 0.2 0 0.2 0 1

# Get one entity that's activating the trap
tag @s add morecombat.wand.dune.update.marker
execute \
    positioned ~-0.5 ~ ~-0.5 \
    as @e[type=#morecombat:wand/dune/can_activate_traps,dx=0,dy=0,dz=0,scores={morecombat.id=0..}] \
    unless score @s morecombat.id = @n[tag=morecombat.wand.dune.update.marker] morecombat.id \
    run tag @s add morecombat.wand.dune.triggeredmany

# Tag cleanup
tag @s remove morecombat.wand.dune.update.marker
tag @e[tag=morecombat.wand.dune.triggeredmany,limit=1] add morecombat.wand.dune.triggered
tag @e[tag=morecombat.wand.dune.triggeredmany] remove morecombat.wand.dune.triggeredmany

# If found a triggering target
execute if entity @n[tag=morecombat.wand.dune.triggered] run function morecombat:functionality/wand/dune/triggered

# More tag cleanup
tag @e[tag=morecombat.wand.dune.triggered] remove morecombat.wand.dune.triggered


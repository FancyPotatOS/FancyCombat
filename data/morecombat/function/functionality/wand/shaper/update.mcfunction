

execute unless block ~ ~ ~ #morecombat:wand/shaper/solid_blocks run return run function morecombat:functionality/wand/shaper/silent_kill

scoreboard players remove @s morecombat.wand.shaper.grace_period 1
execute if score @s morecombat.wand.shaper.grace_period matches ..0 run scoreboard players set @s morecombat.id -1

particle minecraft:ash ~ ~1.05 ~ 0.2 0 0.2 0 1

# Get one entity that's activating the trap
tag @s add morecombat.wand.shaper.update.marker
execute \
    positioned ~-0.5 ~1 ~-0.5 \
    as @e[type=#morecombat:wand/shaper/can_activate_traps,dx=0,dy=0,dz=0,scores={morecombat.id=0..}] \
    unless score @s morecombat.id = @n[tag=morecombat.wand.shaper.update.marker] morecombat.id \
    run tag @s add morecombat.wand.shaper.triggeredmany

# Tag cleanup
tag @s remove morecombat.wand.shaper.update.marker
tag @e[tag=morecombat.wand.shaper.triggeredmany,limit=1] add morecombat.wand.shaper.triggered
tag @e[tag=morecombat.wand.shaper.triggeredmany] remove morecombat.wand.shaper.triggeredmany

# If found a triggering target
execute if entity @n[tag=morecombat.wand.shaper.triggered] run function morecombat:functionality/wand/shaper/triggered

# More tag cleanup
tag @e[tag=morecombat.wand.shaper.triggered] remove morecombat.wand.shaper.triggered


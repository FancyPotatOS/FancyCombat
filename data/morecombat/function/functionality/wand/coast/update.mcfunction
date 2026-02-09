

# Lifetime check
scoreboard players remove @s morecombat.wand.coast.lifetime 1
execute if score @s morecombat.wand.coast.lifetime matches ..0 run return run kill @s

particle minecraft:block{block_state:{Name:"minecraft:ice"}} ~ ~ ~ 1.5 1.5 1.5 0.5 2 force
particle minecraft:enchant ~ ~ ~ 1.5 1.5 1.5 1 2 force
particle minecraft:glow ~ ~ ~ 1.5 1.5 1.5 1 4 force

# Update nearby entities
tag @e[type=#morecombat:wand/coast/can_be_frozen,distance=..10,tag=!morecombat.wand.coast.frozen.immune] add morecombat.wand.coast.frozen.new
execute as @e[type=#morecombat:wand/coast/can_be_frozen,distance=..10,tag=!morecombat.wand.coast.frozen.immune] at @s summon marker run function morecombat:functionality/wand/coast/freeze_entity


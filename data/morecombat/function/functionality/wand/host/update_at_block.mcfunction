

# Only if can be suspicous
execute unless block ~ ~ ~ #morecombat:wand/host/can_be_suspicious as @n[tag=morecombat.wand.host.activator] run return run function morecombat:functionality/wand/host/fail/wrong_block

# Replace the block
fill ~ ~ ~ ~ ~ ~ minecraft:suspicious_gravel replace minecraft:gravel
fill ~ ~ ~ ~ ~ ~ minecraft:suspicious_sand replace minecraft:sand

# Apply item and remove from player
data modify block ~ ~ ~ item set from entity @n[tag=morecombat.wand.host.activator] equipment.offhand
item replace entity @n[tag=morecombat.wand.host.activator] weapon.offhand with minecraft:air

# Obvious response
particle minecraft:block{block_state:{Name:"minecraft:sand"}} ~ ~ ~ 0.5 0.5 0.5 0 1 force
playsound minecraft:block.suspicious_sand.hit player @a[distance=..20] ~ ~ ~ 0.3 0.51


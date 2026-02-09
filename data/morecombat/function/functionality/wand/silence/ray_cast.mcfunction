

execute if score $distance morecombat.temp matches ..0 run return 0
scoreboard players remove $distance morecombat.temp 1

tag @e[type=#morecombat:wand/silence/can_be_attacked,tag=!morecombat.wand.silence.caster,dx=0,dy=0,dz=0,limit=1] add morecombat.wand.silence.found
tag @e[type=#morecombat:wand/silence/can_be_attacked,tag=!morecombat.wand.silence.caster,dx=0,dy=0,dz=0,limit=1] add morecombat.wand.silence.found

execute as @n[tag=morecombat.wand.silence.found] run return 0

execute unless entity @n[tag=morecombat.wand.silence.found] positioned ^ ^ ^1 run function morecombat:functionality/wand/silence/ray_cast

execute if entity @n[tag=morecombat.wand.silence.found] run particle minecraft:sonic_boom ~ ~ ~


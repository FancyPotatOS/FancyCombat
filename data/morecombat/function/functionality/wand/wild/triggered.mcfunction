

execute if entity @s[tag=morecombat.wand.wild.mark.py] run function morecombat:functionality/wand/wild/summon/py
execute if entity @s[tag=morecombat.wand.wild.mark.px] run function morecombat:functionality/wand/wild/summon/px
execute if entity @s[tag=morecombat.wand.wild.mark.nx] run function morecombat:functionality/wand/wild/summon/nx
execute if entity @s[tag=morecombat.wand.wild.mark.pz] run function morecombat:functionality/wand/wild/summon/pz
execute if entity @s[tag=morecombat.wand.wild.mark.nz] run function morecombat:functionality/wand/wild/summon/nz

playsound minecraft:block.note_block.basedrum player @a[distance=..20] ~ ~ ~ 1 0.3
playsound minecraft:block.copper.break player @a[distance=..20] ~ ~ ~ 1 0.3

tag @s remove morecombat.wand.wild.mark.success
tag @s remove morecombat.wand.wild.mark.py
tag @s remove morecombat.wand.wild.mark.px
tag @s remove morecombat.wand.wild.mark.nx
tag @s remove morecombat.wand.wild.mark.pz
tag @s remove morecombat.wand.wild.mark.nz

kill @s


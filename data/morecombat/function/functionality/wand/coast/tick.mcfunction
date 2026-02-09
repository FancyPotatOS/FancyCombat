

execute as @e[type=marker,tag=morecombat.wand.coast.marker] at @s run function morecombat:functionality/wand/coast/update

execute as @e[type=marker,tag=morecombat.wand.coast.frozen] at @s run function morecombat:functionality/wand/coast/update_frozen

execute as @e[type=#morecombat:wand/coast/can_be_frozen,tag=morecombat.wand.coast.frozen.immune] at @s run function morecombat:functionality/wand/coast/update_immune




execute if score @s morecombat.wand.silence.warmup_time matches ..0 run return run tag @s remove morecombat.wand.silence.using

execute if score @s morecombat.wand.silence.stop_check = @s morecombat.wand.silence.warmup_time run return run function morecombat:functionality/wand/silence/stopped_using

scoreboard players operation @s morecombat.wand.silence.stop_check = @s morecombat.wand.silence.warmup_time


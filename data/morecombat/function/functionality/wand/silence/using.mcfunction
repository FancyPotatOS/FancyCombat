

scoreboard players remove @s morecombat.wand.silence.warmup_time 1

execute if score @s morecombat.wand.silence.warmup_time matches 0 run function morecombat:functionality/wand/silence/shoot


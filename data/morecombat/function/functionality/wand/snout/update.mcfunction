

scoreboard players remove @s morecombat.wand.snout.effect_duration 1
execute if score @s morecombat.wand.snout.effect_duration matches ..0 run return run function morecombat:functionality/wand/snout/stop_shooting

scoreboard players operation $temp morecombat.temp = @s morecombat.wand.snout.effect_duration
scoreboard players operation $temp morecombat.temp += $wand.snout.mod_offset morecombat.config
scoreboard players operation $temp morecombat.temp %= $wand.snout.mod_timing morecombat.config

execute if score $temp morecombat.temp matches 0 run function morecombat:functionality/wand/snout/blaze/shoot_fireball


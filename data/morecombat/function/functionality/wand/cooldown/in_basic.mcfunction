

execute unless score @s morecombat.wand.cooldown.all matches -2147483648..2147483647 run function morecombat:functionality/wand/cooldown/init

scoreboard players set $cooldown_id morecombat.temp 0
execute if score @s morecombat.play_time < @s morecombat.wand.cooldown.all run return 1
scoreboard players set $cooldown_id morecombat.temp 1
execute if score @s morecombat.play_time < @s morecombat.wand.cooldown.basic run return 1
return fail


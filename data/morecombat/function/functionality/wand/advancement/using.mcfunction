

scoreboard players operation $temp morecombat.wand.last_use = @s morecombat.wand.last_use
scoreboard players operation $temp morecombat.wand.last_use -= @s morecombat.play_time

execute if score $temp morecombat.wand.last_use matches ..-2 run function morecombat:functionality/wand/pressed

execute if score $temp morecombat.wand.last_use matches -1.. run function morecombat:functionality/wand/using

scoreboard players operation @s morecombat.wand.last_use = @s morecombat.play_time
advancement revoke @s only morecombat:wand/using


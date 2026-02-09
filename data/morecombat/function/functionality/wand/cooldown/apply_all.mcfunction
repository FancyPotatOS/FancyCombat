

# Expectation: score `$cooldown morecombat.temp` is set

scoreboard players operation $temp morecombat.temp = @s morecombat.play_time
scoreboard players operation $temp morecombat.temp += $cooldown morecombat.temp

execute if score @s morecombat.wand.cooldown.all < $temp morecombat.temp run scoreboard players operation @s morecombat.wand.cooldown.all = $temp morecombat.temp




execute if score @s morecombat.id matches -2147483648..2147483647 run return 0

scoreboard players operation @s morecombat.id = $next_id morecombat.id
scoreboard players add $next_id morecombat.id 1



scoreboard players operation $_trials morecombat.temp = $trials morecombat.temp
scoreboard players set $out morecombat.temp 0
execute if score $trials morecombat.temp matches 1..1000 if score $chance morecombat.temp matches 1..1000000000 run function morecombat:random/binomial_loop
scoreboard players reset $_trials morecombat.temp


# Expectation: score `$cost morecombat.temp` set to durabilty charge
# Expectation: score `$max_damage morecombat.temp` set to max damage
# Expectation: score `$damage morecombat.temp` set to current damage
scoreboard players operation $max_damage morecombat.temp -= $damage morecombat.temp
scoreboard players operation $max_damage morecombat.temp -= $cost morecombat.temp

execute if score $max_damage morecombat.temp matches ..-1 run return fail

return 1


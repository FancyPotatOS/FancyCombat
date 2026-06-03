

# We're going to do something stupid and simulate the distance function without square roots
# abs(delta x) = a
# abs(delta z) = b
# f = a + b
# g = max(a, b) - min(a, b)
# distance = (15f + g)/20
# We get it accurate within <2.5 for distances up to 15, which is _good enough_ for our purposes


execute if predicate morecombat:wand/raiser/item_sound_chance run playsound minecraft:block.furnace.fire_crackle neutral @a[distance=..20] ~ ~ ~ 0.3 2


scoreboard players set scale morecombat.temp 10000
scoreboard players set -1 morecombat.temp -1
scoreboard players set 15 morecombat.temp 15
scoreboard players set 20 morecombat.temp 20

# a
execute store result score dx morecombat.temp run data get entity @s Pos[0] 10000
execute store result score temp2 morecombat.temp run data get entity @n[tag=morecombat.wand.raiser.user] Pos[0] 10000
scoreboard players operation dx morecombat.temp -= temp2 morecombat.temp
scoreboard players operation temp morecombat.temp = dx morecombat.temp
execute if score temp morecombat.temp matches ..0 run scoreboard players operation temp morecombat.temp *= -1 morecombat.temp
scoreboard players operation a morecombat.temp = temp morecombat.temp

# b
execute store result score dz morecombat.temp run data get entity @s Pos[2] 10000
execute store result score temp2 morecombat.temp run data get entity @n[tag=morecombat.wand.raiser.user] Pos[2] 10000
scoreboard players operation dz morecombat.temp -= temp2 morecombat.temp
scoreboard players operation temp morecombat.temp = dz morecombat.temp
execute if score temp morecombat.temp matches ..0 run scoreboard players operation temp morecombat.temp *= -1 morecombat.temp
scoreboard players operation b morecombat.temp = temp morecombat.temp

# max
scoreboard players operation max morecombat.temp = a morecombat.temp
execute if score b morecombat.temp > a morecombat.temp run scoreboard players operation max morecombat.temp = b morecombat.temp

# min
scoreboard players operation max morecombat.temp = a morecombat.temp
execute if score b morecombat.temp < a morecombat.temp run scoreboard players operation max morecombat.temp = b morecombat.temp

# f
scoreboard players operation f morecombat.temp = a morecombat.temp
scoreboard players operation f morecombat.temp += b morecombat.temp

# g
scoreboard players operation g morecombat.temp = max morecombat.temp
scoreboard players operation g morecombat.temp -= min morecombat.temp

# (15f + g)/20
scoreboard players operation distance morecombat.temp = f morecombat.temp
scoreboard players operation distance morecombat.temp *= 15 morecombat.temp
scoreboard players operation distance morecombat.temp += g morecombat.temp
scoreboard players operation distance morecombat.temp /= 20 morecombat.temp

# Get proportion of distance that is x
scoreboard players operation prop_x morecombat.temp = a morecombat.temp
scoreboard players operation prop_x morecombat.temp *= scale morecombat.temp
scoreboard players operation prop_x morecombat.temp /= distance morecombat.temp
execute if score dx morecombat.temp matches 0.. run scoreboard players operation prop_x morecombat.temp *= -1 morecombat.temp

# Get proportion of distance that is z
scoreboard players operation prop_z morecombat.temp = b morecombat.temp
scoreboard players operation prop_z morecombat.temp *= scale morecombat.temp
scoreboard players operation prop_z morecombat.temp /= distance morecombat.temp
execute if score dz morecombat.temp matches 0.. run scoreboard players operation prop_z morecombat.temp *= -1 morecombat.temp

execute store result score temp morecombat.temp run data get entity @s Motion[0] 200000
scoreboard players operation prop_x morecombat.temp += temp morecombat.temp
execute store result entity @s Motion[0] double 0.000005 run scoreboard players get prop_x morecombat.temp

execute store result score temp morecombat.temp run data get entity @s Motion[2] 200000
scoreboard players operation prop_z morecombat.temp += temp morecombat.temp
execute store result entity @s Motion[2] double 0.000005 run scoreboard players get prop_z morecombat.temp


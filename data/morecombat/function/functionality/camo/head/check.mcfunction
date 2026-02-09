

execute unless block ~ ~ ~ #morecombat:camo/branches/531 if predicate morecombat:functionality/camo/wearing/clear run return run function morecombat:functionality/camo/head/clear

# Item replacement setup
summon item ~ ~ ~ {Age:1,Tags:["morecombat.camo.temp_item"],Item:{count:1,id:"minecraft:stone"}}
data modify entity @n[tag=morecombat.camo.temp_item] Item set from entity @s equipment.head

## Block binary search
function morecombat:functionality/camo/head/binary/531
##

# Apply and teardown
item replace entity @s armor.head from entity @n[tag=morecombat.camo.temp_item] contents
kill @n[tag=morecombat.camo.temp_item]

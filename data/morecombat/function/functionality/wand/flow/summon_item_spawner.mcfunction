

summon minecraft:ominous_item_spawner ~ ~ ~ {Tags:["morecombat.wand.flow.ominous_item_spawner", "morecombat.wand.flow.ominous_item_spawner.new"],spawn_item_after_ticks:40L,item:{id:"minecraft:stone",count:1}}

# Apply spawn delay
scoreboard players operation $temp morecombat.temp = $wand.flow.spawn_delay morecombat.config
data modify storage morecombat:data macro set value {"min":0,"max":0}
execute store result storage morecombat:data macro.max int 1 run scoreboard players get $wand.flow.spawn_delay_delta morecombat.config
function morecombat:macro/rng with storage morecombat:data macro
scoreboard players operation $temp morecombat.temp += $rng morecombat.temp

execute store result entity @s spawn_item_after_ticks long 1 run scoreboard players get $temp morecombat.temp

data modify entity @n[tag=morecombat.wand.flow.ominous_item_spawner.new] item set from entity @n[tag=morecombat.wand.flow.activator] equipment.offhand
data modify entity @n[tag=morecombat.wand.flow.ominous_item_spawner.new] item.count set value 1

tag @n[tag=morecombat.wand.flow.ominous_item_spawner.new] remove morecombat.wand.flow.ominous_item_spawner.new



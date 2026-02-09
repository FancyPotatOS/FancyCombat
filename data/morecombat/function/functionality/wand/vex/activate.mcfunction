

# Hold check
execute unless predicate morecombat:wand/vex/holding run return 0

# Charge check
scoreboard players set $cost morecombat.temp 24
execute unless function morecombat:functionality/wand/durability/has_enough_mainhand run return run function morecombat:functionality/wand/durability/fail/too_damaged

# Cooldown check
execute if function morecombat:functionality/wand/cooldown/in_basic run return run function morecombat:functionality/wand/fail/cooldown

# Charge
scoreboard players set $cost morecombat.temp 24
function morecombat:functionality/wand/durability/charge

scoreboard players operation $warmup morecombat.temp = $wand.vex.fang.warmup.start morecombat.config
scoreboard players operation $fang_count morecombat.temp = $wand.vex.fang.count morecombat.config
tag @s add morecombat.wand.vex.activator
summon minecraft:armor_stand ~ ~ ~ {Tags:["morecombat.wand.vex.armor_stand.temp"]}
data modify entity @n[tag=morecombat.wand.vex.armor_stand.temp] Rotation set from entity @s Rotation
data modify entity @n[tag=morecombat.wand.vex.armor_stand.temp] Rotation[1] set value 0
execute rotated as @n[tag=morecombat.wand.vex.armor_stand.temp] positioned ~ ~0.5 ~ positioned ^ ^ ^1 run function morecombat:functionality/wand/vex/find_ground
tag @s remove morecombat.wand.vex.activator
kill @n[tag=morecombat.wand.vex.armor_stand.temp]

# Apply cooldown
scoreboard players operation $cooldown morecombat.temp = $wand.vex.cooldown morecombat.config
function morecombat:functionality/wand/cooldown/apply_basic


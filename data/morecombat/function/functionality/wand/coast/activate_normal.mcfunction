

# Charge check
scoreboard players set $cost morecombat.temp 8
execute unless function morecombat:functionality/wand/durability/has_enough_mainhand run return run function morecombat:functionality/wand/durability/fail/too_damaged

# Cooldown check
execute if function morecombat:functionality/wand/cooldown/in_basic run return run function morecombat:functionality/wand/fail/cooldown

# Charge
scoreboard players set $cost morecombat.temp 8
function morecombat:functionality/wand/durability/charge

tag @s add morecombat.wand.coast.activator
execute summon minecraft:marker run function morecombat:functionality/wand/coast/init_marker
tag @s remove morecombat.wand.coast.activator

playsound sounds:block.ice.break player @a[distance=..30] ~ ~ ~ 0.5 2
playsound sounds:block.ice.break player @a[distance=..30] ~ ~ ~ 0.5 0.5
playsound block.beacon.ambient player @a[distance=..30] ~ ~ ~ 0.5 0.4

function morecombat:functionality/wand/coast/grant_immunity

# Apply cooldown
scoreboard players operation $cooldown morecombat.temp = $wand.coast.cooldown morecombat.config
function morecombat:functionality/wand/cooldown/apply_basic


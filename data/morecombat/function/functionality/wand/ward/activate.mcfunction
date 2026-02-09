

# Hold check
execute unless predicate morecombat:wand/ward/holding run return 0

# Charge check
scoreboard players set $cost morecombat.temp 24
execute unless function morecombat:functionality/wand/durability/has_enough_mainhand run return run function morecombat:functionality/wand/durability/fail/too_damaged

# Cooldown check
execute if function morecombat:functionality/wand/cooldown/in_basic run return run function morecombat:functionality/wand/fail/cooldown

# Charge
scoreboard players set $cost morecombat.temp 24
function morecombat:functionality/wand/durability/charge

particle minecraft:sculk_charge_pop ~ ~1 ~ 0.1 0.5 0.1 0.1 20
playsound minecraft:block.sculk_sensor.clicking player @a[distance=..30] ~ ~ ~ 1 0.5

tag @s add morecombat.wand.ward.sculking
# Apply lifetime
scoreboard players operation @s morecombat.wand.ward.lifetime = $wand.ward.base_lifetime morecombat.config
data modify storage morecombat:data macro set value {"min":0,"max":0}
execute store result storage morecombat:data macro.max int 1 run scoreboard players get $wand.ward.lifetime_delta morecombat.config
function morecombat:macro/rng with storage morecombat:data macro
scoreboard players operation @s morecombat.wand.ward.lifetime += $rng morecombat.temp

# Apply cooldown
scoreboard players operation $cooldown morecombat.temp = $wand.ward.cooldown morecombat.config
function morecombat:functionality/wand/cooldown/apply_basic


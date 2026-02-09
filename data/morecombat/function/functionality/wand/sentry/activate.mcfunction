

# Hold check
execute unless predicate morecombat:wand/sentry/holding run return 0

# Charge check
scoreboard players set $cost morecombat.temp 24
execute unless function morecombat:functionality/wand/durability/has_enough_mainhand run return run function morecombat:functionality/wand/durability/fail/too_damaged

# Cooldown check
execute if function morecombat:functionality/wand/cooldown/in_basic run return run function morecombat:functionality/wand/fail/cooldown

# Charge
scoreboard players set $cost morecombat.temp 24
function morecombat:functionality/wand/durability/charge

tag @s add morecombat.wand.sentry.activator
execute summon minecraft:marker run function morecombat:functionality/wand/sentry/init_marker
tag @s remove morecombat.wand.sentry.activator

playsound minecraft:block.beacon.power_select player @a[distance=..30] ~ ~ ~ 0.5 2
playsound block.beacon.ambient player @a[distance=..30] ~ ~ ~ 0.5 0.4

# Apply cooldown
scoreboard players operation $cooldown morecombat.temp = $wand.sentry.cooldown morecombat.config
function morecombat:functionality/wand/cooldown/apply_basic


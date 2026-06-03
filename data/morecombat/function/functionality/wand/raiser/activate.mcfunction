

# Hold check
execute unless predicate morecombat:wand/raiser/holding run return 0

# Charge check
scoreboard players set $cost morecombat.temp 16
execute unless function morecombat:functionality/wand/durability/has_enough_mainhand run return run function morecombat:functionality/wand/durability/fail/too_damaged

# Cooldown check
execute if function morecombat:functionality/wand/cooldown/in_basic run return run function morecombat:functionality/wand/fail/cooldown

# Charge
scoreboard players set $cost morecombat.temp 16
function morecombat:functionality/wand/durability/charge

# Apply tag and duration
tag @s add morecombat.wand.raiser.magnetic
scoreboard players operation @s morecombat.wand.raiser.effect_duration = $wand.raiser.duration morecombat.config

# Play effects
playsound minecraft:entity.firework_rocket.twinkle player @a[distance=..20] ~ ~ ~ 0.5 2
playsound minecraft:entity.firework_rocket.twinkle_far player @a[distance=..20] ~ ~ ~ 0.5 2
particle minecraft:electric_spark ~ ~1 ~ 1 1 1 1 40

# Apply cooldown
scoreboard players operation $cooldown morecombat.temp = $wand.raiser.cooldown morecombat.config
function morecombat:functionality/wand/cooldown/apply_basic




# Hold check
execute unless predicate morecombat:wand/spire/holding run return 0

# Charge check
scoreboard players set $cost morecombat.temp 16
execute unless function morecombat:functionality/wand/durability/has_enough_mainhand run return run function morecombat:functionality/wand/durability/fail/too_damaged

# Cooldown check
execute if function morecombat:functionality/wand/cooldown/in_basic run return run function morecombat:functionality/wand/fail/cooldown

# Charge
scoreboard players set $cost morecombat.temp 16
function morecombat:functionality/wand/durability/charge

tag @s add morecombat.wand.spire.activator
execute positioned ~ ~1 ~ summon minecraft:shulker_bullet run function morecombat:functionality/wand/spire/init_bullet
tag @s remove morecombat.wand.spire.activator

particle minecraft:end_rod ~ ~1 ~ 0.2 0.4 0.2 0 10 force
playsound minecraft:entity.shulker.shoot player @a[distance=..30] ~ ~ ~ 1.5

# Apply cooldown
scoreboard players operation $cooldown morecombat.temp = $wand.spire.cooldown morecombat.config
function morecombat:functionality/wand/cooldown/apply_basic




# Hold check
execute unless predicate morecombat:wand/flow/holding run return 0

# Charge check
scoreboard players set $cost morecombat.temp 16
execute unless function morecombat:functionality/wand/durability/has_enough_mainhand run return run function morecombat:functionality/wand/durability/fail/too_damaged

# Cooldown check
execute if function morecombat:functionality/wand/cooldown/in_basic run return run function morecombat:functionality/wand/fail/cooldown

# Hold check
execute unless predicate morecombat:wand/flow/holding_ammo run return run function morecombat:functionality/wand/flow/fail/no_offhand

# Charge
scoreboard players set $cost morecombat.temp 16
function morecombat:functionality/wand/durability/charge

tag @s add morecombat.wand.flow.activator
function morecombat:functionality/wand/flow/create_spawners
tag @s remove morecombat.wand.flow.activator

particle minecraft:trial_omen ~ ~1 ~ 0.2 0.4 0.2 0 20 force
playsound minecraft:block.trial_spawner.about_to_spawn_item player @a[distance=..30] ~ ~ ~ 1.5

item modify entity @s weapon.offhand morecombat:reduce_item_count

# Apply cooldown
scoreboard players operation $cooldown morecombat.temp = $wand.flow.cooldown morecombat.config
function morecombat:functionality/wand/cooldown/apply_basic


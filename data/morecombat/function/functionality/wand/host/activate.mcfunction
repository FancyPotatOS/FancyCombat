

# Hold check
execute unless predicate morecombat:wand/host/holding run return 0

# Charge check
scoreboard players set $cost morecombat.temp 1
execute unless function morecombat:functionality/wand/durability/has_enough_mainhand run return 0

# Cooldown check
execute if function morecombat:functionality/wand/cooldown/in_basic run return run function morecombat:functionality/wand/fail/cooldown

# Hold check
execute unless predicate morecombat:wand/host/bundle_in_offhand run return run function morecombat:functionality/wand/host/fail/no_offhand

# Looking block exists or return
execute at @s anchored eyes positioned ^ ^ ^ run function iris:get_target
execute unless entity @n[tag=iris.targeted_block] run return 0

# Charge
scoreboard players set $cost morecombat.temp 1
function morecombat:functionality/wand/durability/charge

tag @s add morecombat.wand.host.activator
execute as @n[tag=iris.targeted_block] at @s run function morecombat:functionality/wand/host/update_at_block
tag @s remove morecombat.wand.host.activator

# Apply cooldown
scoreboard players operation $cooldown morecombat.temp = $wand.host.cooldown morecombat.config
function morecombat:functionality/wand/cooldown/apply_basic


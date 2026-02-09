

# Hold check
execute unless predicate morecombat:wand/shaper/holding run return fail

# Charge check
scoreboard players set $cost morecombat.temp 8
execute unless function morecombat:functionality/wand/durability/has_enough_mainhand run return run function morecombat:functionality/wand/durability/fail/too_damaged

# Cooldown check
execute if function morecombat:functionality/wand/cooldown/in_basic run return run function morecombat:functionality/wand/fail/cooldown

# Hold check
execute unless predicate morecombat:wand/shaper/holding_ammo run return run function morecombat:functionality/wand/shaper/fail/no_offhand

# Looking block exists or return
execute at @s anchored eyes positioned ^ ^ ^ run function iris:get_target
execute unless entity @n[tag=iris.targeted_block] run return 0

# Block check
execute at @n[tag=iris.targeted_block] unless block ~ ~ ~ #morecombat:wand/shaper/solid_blocks run return run function morecombat:functionality/wand/shaper/fail/wrong_block

# Charge
scoreboard players set $cost morecombat.temp 8
function morecombat:functionality/wand/durability/charge

execute at @n[tag=iris.targeted_block] if block ~ ~ ~ #morecombat:wand/shaper/solid_blocks run function morecombat:functionality/wand/shaper/activate_at_block


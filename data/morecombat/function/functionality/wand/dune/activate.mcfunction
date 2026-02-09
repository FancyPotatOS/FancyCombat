
# Hold check
execute unless predicate morecombat:wand/dune/holding run return fail

# Charge check
scoreboard players set $cost morecombat.temp 32
execute unless function morecombat:functionality/wand/durability/has_enough_mainhand run return run function morecombat:functionality/wand/durability/fail/too_damaged

# Cooldown check
execute if function morecombat:functionality/wand/cooldown/in_basic run return run function morecombat:functionality/wand/fail/cooldown

# Hold check
execute unless predicate morecombat:wand/dune/holding_ammo run return run function morecombat:functionality/wand/dune/fail/no_offhand

# Looking block exists or return
execute at @s anchored eyes positioned ^ ^ ^ run function iris:get_target
execute unless entity @n[tag=iris.targeted_block] run return 0

# Charge
scoreboard players set $cost morecombat.temp 32
function morecombat:functionality/wand/durability/charge

execute at @n[tag=iris.targeted_block] if block ~ ~1 ~ #morecombat:wand/dune/air_like positioned ~ ~1 ~ run function morecombat:functionality/wand/dune/activate_at_block
execute at @n[tag=iris.targeted_block] unless block ~ ~1 ~ #morecombat:wand/dune/air_like run function morecombat:functionality/wand/dune/activate_at_block


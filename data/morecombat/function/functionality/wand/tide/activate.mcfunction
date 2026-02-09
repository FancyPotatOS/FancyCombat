

# Hold check
execute unless predicate morecombat:wand/tide/holding run return 0

# Charge check
scoreboard players set $cost morecombat.temp 8
execute unless function morecombat:functionality/wand/durability/has_enough_mainhand run return run function morecombat:functionality/wand/durability/fail/too_damaged

# Cooldown check
execute if function morecombat:functionality/wand/cooldown/in_basic run return run function morecombat:functionality/wand/fail/cooldown

# Charge
scoreboard players set $cost morecombat.temp 8
function morecombat:functionality/wand/durability/charge

function morecombat:functionality/wand/tide/apply_effect

# Apply cooldown
scoreboard players operation $cooldown morecombat.temp = $wand.tide.cooldown morecombat.config
function morecombat:functionality/wand/cooldown/apply_basic


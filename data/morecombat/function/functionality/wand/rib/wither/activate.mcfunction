

# Charge check
scoreboard players set $cost morecombat.temp 8
execute unless function morecombat:functionality/wand/durability/has_enough_mainhand run return run function morecombat:functionality/wand/durability/fail/too_damaged
function morecombat:functionality/wand/durability/charge

function morecombat:functionality/wand/rib/wither/shoot

# Apply cooldown
scoreboard players operation $cooldown morecombat.temp = $wand.rib.cooldown morecombat.config
function morecombat:functionality/wand/cooldown/apply_basic


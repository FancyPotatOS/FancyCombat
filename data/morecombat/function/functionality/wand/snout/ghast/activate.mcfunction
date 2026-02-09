

# Charge check
scoreboard players set $cost morecombat.temp 24
execute unless function morecombat:functionality/wand/durability/has_enough_mainhand run return run function morecombat:functionality/wand/durability/fail/too_damaged
function morecombat:functionality/wand/durability/charge

function morecombat:functionality/wand/snout/ghast/shoot_fireball

# Apply cooldown
scoreboard players operation $cooldown morecombat.temp = $wand.snout.longer_cooldown morecombat.config
function morecombat:functionality/wand/cooldown/apply_basic


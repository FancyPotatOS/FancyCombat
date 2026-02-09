

# Charge check
scoreboard players set $cost morecombat.temp 16
execute unless function morecombat:functionality/wand/durability/has_enough_mainhand run return run function morecombat:functionality/wand/durability/fail/too_damaged
function morecombat:functionality/wand/durability/charge

function morecombat:functionality/wand/snout/blaze/shoot_fireball
function morecombat:functionality/wand/snout/start_shooting

# Apply cooldown
scoreboard players operation $cooldown morecombat.temp = $wand.snout.cooldown morecombat.config
function morecombat:functionality/wand/cooldown/apply_basic


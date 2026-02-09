

# Charge check
scoreboard players set $cost morecombat.temp 64
execute unless function morecombat:functionality/wand/durability/has_enough_mainhand run return run function morecombat:functionality/wand/durability/fail/too_damaged

# Cooldown check
execute if function morecombat:functionality/wand/cooldown/in_advanced run return run function morecombat:functionality/wand/fail/cooldown_advanced

# Hold check
execute unless predicate morecombat:wand/coast/holding_ammo run return run function morecombat:functionality/wand/coast/fail/no_offhand

# Charge
scoreboard players set $cost morecombat.temp 64
function morecombat:functionality/wand/durability/charge

playsound minecraft:entity.lightning_bolt.thunder player @a[distance=0..] ~ ~ ~ 1000 0.4 1
playsound minecraft:entity.lightning_bolt.thunder player @a[distance=0..] ~ ~ ~ 1000 1.8 1
weather thunder

item modify entity @s weapon.offhand morecombat:reduce_item_count

# Apply cooldown
scoreboard players operation $cooldown morecombat.temp = $wand.coast.longer_cooldown morecombat.config
function morecombat:functionality/wand/cooldown/apply_advanced




# Hold check
execute unless predicate morecombat:wand/base/holding run return 0

# Hold check
execute unless predicate morecombat:wand/base/holding_ammo run return run function morecombat:functionality/wand/base/fail/no_offhand

# Apply the template
function #morecombat:wand/apply

# Consume the item
item modify entity @s weapon.offhand morecombat:reduce_item_count

scoreboard players set $cooldown morecombat.temp 1
function morecombat:functionality/wand/cooldown/apply_all


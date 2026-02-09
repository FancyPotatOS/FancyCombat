

# Hold check
execute unless predicate morecombat:wand/bolt/holding run return 0

# Charge check
scoreboard players set $cost morecombat.temp 8
execute unless function morecombat:functionality/wand/durability/has_enough_mainhand run return run function morecombat:functionality/wand/durability/fail/too_damaged

# Cooldown check
execute if function morecombat:functionality/wand/cooldown/in_basic run return run function morecombat:functionality/wand/fail/cooldown

# Entity check
execute unless entity @n[type=#morecombat:wand/bolt/changeable,distance=..15] run return run function morecombat:functionality/wand/bolt/fail/no_entities

# Charge
scoreboard players set $cost morecombat.temp 8
function morecombat:functionality/wand/durability/charge

execute as @e[type=#morecombat:wand/bolt/changeable,distance=..15,limit=10] at @s run function morecombat:functionality/wand/bolt/change_mob

playsound minecraft:entity.evoker.cast_spell player @a[distance=..15] ~ ~ ~ 1 1.5
particle minecraft:entity_effect{color:15263976} ~ ~1 ~ 0.15 0.5 0.15 1 20

# Apply cooldown
scoreboard players operation $cooldown morecombat.temp = $wand.bolt.cooldown morecombat.config
function morecombat:functionality/wand/cooldown/apply_basic


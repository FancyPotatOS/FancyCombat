

# Hold check
execute unless predicate morecombat:wand/eye/holding run return 0

# Charge check
scoreboard players set $cost morecombat.temp 32
execute unless function morecombat:functionality/wand/durability/has_enough_mainhand run return run function morecombat:functionality/wand/durability/fail/too_damaged

# Cooldown check
execute if function morecombat:functionality/wand/cooldown/in_basic run return run function morecombat:functionality/wand/fail/cooldown

# Charge
scoreboard players set $cost morecombat.temp 32
function morecombat:functionality/wand/durability/charge

tag @s add morecombat.wand.eye.activator
execute anchored eyes positioned ^ ^ ^0.5 rotated as @s summon minecraft:dragon_fireball positioned 0.0 0 0.0 positioned ^ ^ ^1 run function morecombat:functionality/wand/eye/init_fireball
tag @s remove morecombat.wand.eye.activator

particle minecraft:dragon_breath ~ ~1 ~ 0.2 0.4 0.2 0.1 25 force
playsound minecraft:entity.ender_dragon.shoot player @a[distance=..30] ~ ~ ~ 1.5

# Apply cooldown
scoreboard players operation $cooldown morecombat.temp = $wand.eye.cooldown morecombat.config
function morecombat:functionality/wand/cooldown/apply_basic


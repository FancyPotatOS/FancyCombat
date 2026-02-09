

# Hold check
execute unless predicate morecombat:wand/wayfinder/holding run return 0

# Charge check
scoreboard players set $cost morecombat.temp 1
execute unless function morecombat:functionality/wand/durability/has_enough_mainhand run return run function morecombat:functionality/wand/durability/fail/too_damaged
function morecombat:functionality/wand/durability/charge

# Cooldown check
execute if function morecombat:functionality/wand/cooldown/in_basic run return run function morecombat:functionality/wand/fail/cooldown

# Charge
scoreboard players set $cost morecombat.temp 1
function morecombat:functionality/wand/durability/charge

tag @s add morecombat.wand.wayfinder.activator
execute anchored eyes positioned ^ ^ ^0.5 rotated as @s summon minecraft:llama_spit positioned 0.0 0 0.0 positioned ^ ^ ^1 run function morecombat:functionality/wand/wayfinder/init_spit
tag @s remove morecombat.wand.wayfinder.activator

playsound minecraft:entity.llama.spit player @a[distance=..15] ~ ~ ~ 0.5

# Apply cooldown
scoreboard players operation $cooldown morecombat.temp = $wand.wayfinder.cooldown morecombat.config
function morecombat:functionality/wand/cooldown/apply_basic


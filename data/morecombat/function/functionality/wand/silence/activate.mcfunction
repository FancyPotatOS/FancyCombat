

# Hold check
execute unless predicate morecombat:wand/silence/holding run return 0

# Charge check
scoreboard players set $cost morecombat.temp 48
execute unless function morecombat:functionality/wand/durability/has_enough_mainhand run return run function morecombat:functionality/wand/durability/fail/too_damaged

# Cooldown check
execute if function morecombat:functionality/wand/cooldown/in_basic run return run function morecombat:functionality/wand/fail/cooldown

# Charge
scoreboard players set $cost morecombat.temp 48
function morecombat:functionality/wand/durability/charge

tag @s add morecombat.wand.silence.using

tag @s add morecombat.wand.silence.activator
function morecombat:functionality/wand/silence/start_attack
tag @s remove morecombat.wand.silence.activator

scoreboard players set @s morecombat.wand.silence.stop_check -1

playsound minecraft:entity.warden.sonic_charge player @a[distance=..40] ~ ~ ~ 1 1.2


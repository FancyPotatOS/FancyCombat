
# Trap too close
execute if entity @e[type=marker,tag=morecombat.wand.wild.trap,distance=..1] run return run function morecombat:functionality/wand/wild/fail/close_trap

# Cooldown check
execute if function morecombat:functionality/wand/cooldown/in_basic run return run function morecombat:functionality/wand/fail/cooldown

function morecombat:set_id
tag @s add morecombat.wand.wild.activator
execute align xyz positioned ~0.5 ~ ~0.5 summon minecraft:marker run function morecombat:functionality/wand/wild/init_trap
tag @s remove morecombat.wand.wild.activator

playsound minecraft:block.wooden_button.click_on player @a[distance=..20] ~ ~ ~ 1 0.2
playsound minecraft:block.piston.extend player @a[distance=..20] ~ ~ ~ 1 1.6
particle minecraft:poof ~ ~0.1 ~ 0.2 0.2 0.2 0.1 20

# Apply cooldown
scoreboard players operation $cooldown morecombat.temp = $wand.wild.cooldown morecombat.config
function morecombat:functionality/wand/cooldown/apply_basic


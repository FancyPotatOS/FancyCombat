
# Trap too close
execute if entity @e[type=marker,tag=morecombat.wand.shaper.trap,distance=..1] run return run function morecombat:functionality/wand/shaper/fail/close_trap

# Cooldown check
execute if function morecombat:functionality/wand/cooldown/in_basic run return run function morecombat:functionality/wand/fail/cooldown

function morecombat:set_id
tag @s add morecombat.wand.shaper.activator
execute align xyz positioned ~0.5 ~ ~0.5 summon minecraft:marker run function morecombat:functionality/wand/shaper/init_trap
tag @s remove morecombat.wand.shaper.activator

playsound minecraft:block.wooden_button.click_on player @a[distance=..20] ~ ~ ~ 1 0.2
playsound minecraft:block.wood.fall player @a[distance=..20] ~ ~ ~ 1 0.3
particle minecraft:poof ~ ~0.1 ~ 0.2 0.2 0.2 0.1 20

# Apply cooldown
scoreboard players operation $cooldown morecombat.temp = $wand.shaper.cooldown morecombat.config
function morecombat:functionality/wand/cooldown/apply_basic




scoreboard players operation $distance morecombat.temp = $wand.silence.max_distance morecombat.config
tag @s add morecombat.wand.silence.caster
execute anchored eyes positioned ^ ^ ^1 run function morecombat:functionality/wand/silence/ray_cast

execute unless entity @n[tag=morecombat.wand.silence.found] run function morecombat:functionality/wand/silence/fail/no_target
execute as @n[tag=morecombat.wand.silence.found] at @s run function morecombat:functionality/wand/silence/damage

tag @s remove morecombat.wand.silence.caster
tag @n[tag=morecombat.wand.silence.found] remove morecombat.wand.silence.found

# Apply cooldown
scoreboard players operation $cooldown morecombat.temp = $wand.silence.cooldown morecombat.config
execute unless entity @n[tag=morecombat.wand.silence.found] run scoreboard players operation $cooldown morecombat.temp = $wand.silence.miss_cooldown morecombat.config
function morecombat:functionality/wand/cooldown/apply_basic


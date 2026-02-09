

execute store result score $difficulty morecombat.temp run difficulty

execute if score $difficulty morecombat.temp matches ..1 run damage @s 16 minecraft:sonic_boom by @n[tag=morecombat.wand.silence.caster] from @n[tag=morecombat.wand.silence.caster]
execute if score $difficulty morecombat.temp matches 2 run damage @s 30 minecraft:sonic_boom by @n[tag=morecombat.wand.silence.caster] from @n[tag=morecombat.wand.silence.caster]
execute if score $difficulty morecombat.temp matches 3.. run damage @s 45 minecraft:sonic_boom by @n[tag=morecombat.wand.silence.caster] from @n[tag=morecombat.wand.silence.caster]

execute at @n[tag=morecombat.wand.silence.caster] run playsound entity.warden.sonic_boom player @a[distance=..60] ~ ~ ~ 100 1 1
playsound minecraft:entity.warden.sonic_boom player @a[distance=..40] ~ ~ ~ 20 1.6 1
execute at @n[tag=morecombat.wand.silence.caster] run particle minecraft:sculk_charge_pop ~ ~1 ~ 0.1 0.5 0.1 0.1 20




# Lifetime check
scoreboard players remove @s morecombat.wand.sentry.lifetime 1
execute if score @s morecombat.wand.sentry.lifetime matches ..0 run return run kill @s

particle minecraft:electric_spark ~ ~ ~ 1.5 1.5 1.5 0.5 2 force
particle minecraft:enchant ~ ~ ~ 1.5 1.5 1.5 1 2 force
particle minecraft:glow ~ ~ ~ 1.5 1.5 1.5 1 4 force

# Update nearby projectiles
execute as @e[type=#morecombat:wand/sentry/projectile,tag=!morecombat.wand.sentry.projectile.reflected,distance=..5] at @s run function morecombat:functionality/wand/sentry/reflect_projectile


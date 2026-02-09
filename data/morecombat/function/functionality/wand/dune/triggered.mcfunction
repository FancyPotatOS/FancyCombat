

summon minecraft:tnt ~ ~ ~ {Tags:["morecombat.wand.dune.tnt.new"],explosion_power:1,fuse:1}
summon minecraft:tnt ~ ~ ~ {Tags:["morecombat.wand.dune.tnt.new"],explosion_power:1,fuse:1}
summon minecraft:tnt ~ ~ ~ {Tags:["morecombat.wand.dune.tnt.new"],explosion_power:1,fuse:1}
summon minecraft:tnt ~ ~ ~ {Tags:["morecombat.wand.dune.tnt.new"],explosion_power:1,fuse:1}
summon minecraft:tnt ~ ~ ~ {Tags:["morecombat.wand.dune.tnt.new"],explosion_power:1,fuse:1}

execute as @e[tag=morecombat.wand.dune.tnt.new] at @s run function morecombat:functionality/wand/dune/init_tnt
tag @e[tag=morecombat.wand.dune.tnt.new] remove morecombat.wand.dune.tnt.new

playsound minecraft:block.copper.break player @a[distance=..20] ~ ~ ~ 1 0.3
playsound minecraft:block.sand.break player @a[distance=..20] ~ ~ ~ 1 0.3
playsound minecraft:entity.tnt.primed player @a[distance=..20] ~ ~ ~ 1 0.3
playsound minecraft:entity.tnt.primed player @a[distance=..20] ~ ~ ~ 1 1
playsound minecraft:entity.tnt.primed player @a[distance=..20] ~ ~ ~ 1 1.5

kill @s




function morecombat:functionality/wand/shaper/fell_block
setblock ~ ~ ~ minecraft:air

playsound minecraft:block.wood.break player @a[distance=..20] ~ ~ ~ 1 0.3
playsound minecraft:block.scaffolding.break player @a[distance=..20] ~ ~ ~ 1 0.3

kill @s


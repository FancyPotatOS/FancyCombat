

execute \
    unless entity @s[tag=morecombat.wand.wild.mark.success] \
    if block ~ ~ ~ #morecombat:wand/wild/air_like \
    if blocks ~ ~ ~ ~ ~4 ~ ~ ~1 ~ all \
    run function morecombat:functionality/wand/wild/mark/py
execute \
    unless entity @s[tag=morecombat.wand.wild.mark.success] \
    if block ~ ~ ~ #morecombat:wand/wild/air_like \
    if blocks ~ ~ ~ ~4 ~ ~ ~1 ~ ~ all \
    run function morecombat:functionality/wand/wild/mark/px
execute \
    unless entity @s[tag=morecombat.wand.wild.mark.success] \
    if block ~ ~ ~ #morecombat:wand/wild/air_like \
    if blocks ~ ~ ~ ~-4 ~ ~ ~-5 ~ ~ all \
    run function morecombat:functionality/wand/wild/mark/nx
execute \
    unless entity @s[tag=morecombat.wand.wild.mark.success] \
    if block ~ ~ ~ #morecombat:wand/wild/air_like \
    if blocks ~ ~ ~ ~ ~ ~4 ~ ~ ~1 all \
    run function morecombat:functionality/wand/wild/mark/pz
execute \
    unless entity @s[tag=morecombat.wand.wild.mark.success] \
    if block ~ ~ ~ #morecombat:wand/wild/air_like \
    if blocks ~ ~ ~ ~ ~ ~-4 ~ ~ ~-5 all \
    run function morecombat:functionality/wand/wild/mark/nz

execute unless entity @s[tag=morecombat.wand.wild.mark.success] run return run function morecombat:functionality/wand/wild/fail/no_direction
execute if entity @s[tag=morecombat.wand.wild.mark.success] run function morecombat:functionality/wand/wild/triggered


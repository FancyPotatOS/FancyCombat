

execute as @a \
    if predicate morecombat:functionality/camo/wearing/any \
    if predicate morecombat:functionality/camo/wearing/activate \
    at @s \
    run function morecombat:functionality/camo/check


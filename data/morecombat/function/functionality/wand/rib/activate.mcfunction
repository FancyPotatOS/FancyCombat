

# Hold check
execute unless predicate morecombat:wand/rib/holding run return 0

# Cooldown check
execute if function morecombat:functionality/wand/cooldown/in_basic run return run function morecombat:functionality/wand/fail/cooldown

# Sneak check
execute unless predicate morecombat:sneaking run function morecombat:functionality/wand/rib/wither/activate
execute if predicate morecombat:sneaking run function morecombat:functionality/wand/rib/blue/activate


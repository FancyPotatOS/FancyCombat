

# Hold check
execute unless predicate morecombat:wand/coast/holding run return 0

execute if predicate morecombat:sneaking run return run function morecombat:functionality/wand/coast/activate_sneaking
function morecombat:functionality/wand/coast/activate_normal


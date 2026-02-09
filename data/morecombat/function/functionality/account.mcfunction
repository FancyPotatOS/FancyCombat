#
#   Item Account
#   
#   Purpose: To determine the held weapon and run the corresponding setup function
#
#   Input: None
#


execute if predicate morecombat:holding/sword run function morecombat:functionality/setup/sword

execute if predicate morecombat:holding/axe run function morecombat:functionality/setup/axe

execute if predicate morecombat:holding/pickaxe run function morecombat:functionality/setup/pickaxe

execute if predicate morecombat:holding/shovel run function morecombat:functionality/setup/shovel

execute if predicate morecombat:holding/hoe run function morecombat:functionality/setup/hoe

execute if predicate morecombat:holding/other run function morecombat:functionality/setup/other


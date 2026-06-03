#
#   Migration File V2
#   
#   Purpose: To update the datapack up to this level, then apply new/updated configs or setup
#
#   Input: None
#

# Apply last migration
execute unless score $version morecombat.master matches 1.. run function morecombat:meta/migrations/migration_v0

# Set the version
scoreboard players set $version morecombat.master 2

# Add raiser duration scoreboard
scoreboard objectives add morecombat.wand.raiser.effect_duration dummy

# Apply initial config
function morecombat:functionality/wand/raiser/reset_config

# Update newer configs
function morecombat:functionality/wand/ward/reset_config
function morecombat:functionality/wand/tide/reset_config


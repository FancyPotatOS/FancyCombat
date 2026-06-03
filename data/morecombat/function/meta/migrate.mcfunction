
# Ensure the master scoreboard exists
scoreboard objectives add morecombat.master dummy

# Apply migration if required
execute unless score $version morecombat.master matches 2.. run function morecombat:meta/migrations/latest_version

#
#   Migration File V1
#   
#   Purpose: To update the datapack up to this level, then apply new/updated configs or setup
#
#   Input: None
#

tellraw @a ["",{"text":"[More Combat Datapack]","bold":true,"color":"dark_blue"}," - Setup"]

# Set the version
scoreboard players set $version morecombat.master 1

scoreboard objectives add morecombat.play_time minecraft.custom:minecraft.play_time
scoreboard objectives add morecombat.temp dummy
scoreboard objectives add morecombat.config dummy

scoreboard objectives add morecombat.id dummy
scoreboard players set $next_id morecombat.id 1

# # Brush
scoreboard objectives add morecombat.shears_cooldown dummy
scoreboard objectives add morecombat.brush_cooldown dummy

# # Wands
scoreboard objectives add morecombat.wand.last_use dummy
scoreboard objectives add morecombat.wand.cooldown.all dummy
scoreboard objectives add morecombat.wand.cooldown.basic dummy
scoreboard objectives add morecombat.wand.cooldown.advanced dummy
scoreboard objectives add morecombat.wand.sentry.lifetime dummy
scoreboard objectives add morecombat.wand.coast.immune_time dummy
scoreboard objectives add morecombat.wand.coast.lifetime dummy
scoreboard objectives add morecombat.wand.coast.effect_duration dummy
scoreboard objectives add morecombat.wand.tide.effect_duration dummy
scoreboard objectives add morecombat.wand.ward.lifetime dummy
scoreboard objectives add morecombat.wand.ward.immune_time dummy
scoreboard objectives add morecombat.wand.wild.grace_period dummy
scoreboard objectives add morecombat.wand.dune.grace_period dummy
scoreboard objectives add morecombat.wand.shaper.grace_period dummy
scoreboard objectives add morecombat.wand.silence.warmup_time dummy
scoreboard objectives add morecombat.wand.silence.stop_check dummy
scoreboard objectives add morecombat.wand.snout.effect_duration dummy

# Config Values
scoreboard players set config.shears_cooldown morecombat.master 50
scoreboard players set config.brush_cooldown morecombat.master 30


function #morecombat:reset_config


return 0
scoreboard objectives add fpconflict.conflict_map dummy

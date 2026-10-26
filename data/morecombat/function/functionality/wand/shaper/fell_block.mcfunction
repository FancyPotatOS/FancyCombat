

# Get the block data
summon armor_stand ~ ~ ~ {UUID:[I;0,0,0,1313],Invisible:1b}
execute at 0-0-0-0-521 positioned ~ ~ ~ run loot replace entity 0-0-0-0-521 weapon.mainhand loot blockstate:get

data modify storage morecombat:data macro set value {Name:"minecraft:stone", Properties:"",Properties_prefix:""}

# tellraw @p {"nbt":"equipment.mainhand.components.\"minecraft:custom_data\"","entity":"0-0-0-0-521"}

data modify storage morecombat:data macro.Name set from entity 0-0-0-0-521 equipment.mainhand.components."minecraft:custom_data".id
execute if data entity 0-0-0-0-521 equipment.mainhand.components."minecraft:custom_data".properties run data modify storage morecombat:data macro.Properties set from entity 0-0-0-0-521 equipment.mainhand.components."minecraft:custom_data".properties
execute if data entity 0-0-0-0-521 equipment.mainhand.components."minecraft:custom_data".properties run data modify storage morecombat:data macro.Properties_prefix set value ",properties:"

function morecombat:functionality/wand/shaper/summon_falling_block with storage morecombat:data macro

tag @n[tag=morecombat.wand.shaper.falling_block.new] remove morecombat.wand.shaper.falling_block.new

kill 0-0-0-0-521


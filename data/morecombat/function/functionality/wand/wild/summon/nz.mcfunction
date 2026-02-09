

execute if data entity @s data.item{id:"minecraft:spectral_arrow"} run summon spectral_arrow ~ ~1 ~-5 {Tags:["morecombat.wand.wild.trap.arrow","morecombat.wand.wild.trap.arrow.new"],item:{id:"arrow",count:1},damage:2.0,crit:true,HasBeenShot:true,pickup:false,SoundEvent:"minecraft:entity.arrow.hit",Motion:[0.0d,0.16d,0.9d]}
execute unless data entity @s data.item{id:"minecraft:spectral_arrow"} run summon arrow ~ ~1 ~-5 {Tags:["morecombat.wand.wild.trap.arrow","morecombat.wand.wild.trap.arrow.new"],item:{id:"arrow",count:1},damage:2.0,crit:true,HasBeenShot:true,pickup:false,SoundEvent:"minecraft:entity.arrow.hit",Motion:[0.0d,0.16d,0.9d]}

data modify entity @n[tag=morecombat.wand.wild.trap.arrow.new] item set from entity @s data.item
data modify entity @n[tag=morecombat.wand.wild.trap.arrow.new] Owner set from entity @s data.owner

tag @n[tag=morecombat.wand.wild.trap.arrow.new] remove morecombat.wand.wild.trap.arrow.new




execute align y run summon minecraft:evoker_fangs ~ ~ ~ {Tags:["morecombat.wand.vex.evoker_fang","morecombat.wand.vex.evoker_fang.new"],Warmup:1}
execute store result entity @n[tag=morecombat.wand.vex.evoker_fang.new] Warmup int 1 run scoreboard players get $warmup morecombat.temp
data modify entity @n[tag=morecombat.wand.vex.evoker_fang.new] Owner set from entity @n[tag=morecombat.wand.vex.activator] UUID

tag @n[tag=morecombat.wand.vex.evoker_fang.new] remove morecombat.wand.vex.evoker_fang.new

scoreboard players remove $fang_count morecombat.temp 1
execute if score $fang_count morecombat.temp matches 0 run return 0

scoreboard players operation $warmup morecombat.temp += $wand.vex.fang.warmup.offset morecombat.config
execute positioned ^ ^ ^1 run function morecombat:functionality/wand/vex/find_ground


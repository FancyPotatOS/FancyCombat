

execute store result entity @s explosion_power int 1 run random value 1..2
execute store result entity @s fuse int 1 run random value 10..30
execute store result entity @s Motion[0] double 0.001 run random value -300..300
execute store result entity @s Motion[1] double 0.001 run random value 100..200
execute store result entity @s Motion[2] double 0.001 run random value -300..300


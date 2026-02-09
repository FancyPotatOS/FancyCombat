
# 2/16
execute if predicate {condition:"random_chance",chance:0.12500} run return run data modify entity @s MainGene set value "brown"

# 5/16
execute if predicate {condition:"random_chance",chance:0.35714} run return run data modify entity @s MainGene set value "normal"
execute if predicate {condition:"random_chance",chance:0.55555} run return run data modify entity @s MainGene set value "weak"

# 1/16
execute if predicate {condition:"random_chance",chance:0.25000} run return run data modify entity @s MainGene set value "lazy"
execute if predicate {condition:"random_chance",chance:0.33333} run return run data modify entity @s MainGene set value "worried"
execute if predicate {condition:"random_chance",chance:0.50000} run return run data modify entity @s MainGene set value "playful"
data modify entity @s MainGene set value "aggressive"

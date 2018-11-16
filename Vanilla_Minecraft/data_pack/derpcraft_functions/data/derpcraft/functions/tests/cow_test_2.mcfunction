scoreboard players add Total Temp 1
tp @e[tag=CowTestDummy] @s
execute at @s as @e[tag=CowTestDummy] if score Total Temp matches 1 run summon pig ~ ~ ~
execute at @s as @e[tag=CowTestDummy] if score Total Temp matches 2 run summon sheep ~ ~ ~
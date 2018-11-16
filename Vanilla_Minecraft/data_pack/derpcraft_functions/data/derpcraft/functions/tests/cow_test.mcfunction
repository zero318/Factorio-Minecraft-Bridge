scoreboard players set Count Temp 0
scoreboard players set Total Temp 0
execute store result score Count Temp if entity @e[tag=TestCow]
execute as @e[tag=TestCow] at @s run function derpcraft:tests/cow_test_2
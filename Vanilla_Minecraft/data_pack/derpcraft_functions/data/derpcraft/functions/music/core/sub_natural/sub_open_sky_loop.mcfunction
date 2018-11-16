execute at @s run teleport ~ ~1 ~
execute store result score @s YPos run data get entity @s Pos[1]
execute at @s if block ~ ~ ~ #derpcraft:sky_test/sky_test run function derpcraft:music/core/sub_natural/sub_open_sky_loop
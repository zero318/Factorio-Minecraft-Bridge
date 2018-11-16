execute unless entity @e[tag=OpenSkyTester] run summon minecraft:armor_stand ~ ~ ~ {NoAI:1,Silent:1,Invulnerable:1,Invisible:1,Marker:1,NoBasePlate:1,Small:1,NoGravity:1,Tags:["OpenSkyTester"]}
tp @e[tag=OpenSkyTester] ~ ~ ~
execute as @e[tag=OpenSkyTester] store result score @s YPos run data get entity @s Pos[1]
execute as @e[tag=OpenSkyTester] run function derpcraft:music/core/sub_natural/sub_open_sky_loop
execute if entity @e[tag=OpenSkyTester,scores={YPos=256}] run tag @s add OpenSky
execute unless entity @e[tag=OpenSkyTester,scores={YPos=256}] run tag @s remove OpenSky
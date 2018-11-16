execute if score @s Dimension matches 0 align xyz positioned ~0.5 ~1 ~0.5 run function derpcraft:music/core/sub_natural/sub_open_sky
execute if entity @s[tag=OpenSky] if block ~ ~ ~ minecraft:air run scoreboard players set @s LastAir 0
execute unless score @s Dimension matches 0 if block ~ ~ ~ minecraft:air run scoreboard players set @s LastAir 0
execute if block ~ ~ ~ minecraft:cave_air run scoreboard players set @s LastAir 1
execute if block ~ ~ ~ minecraft:void_air run scoreboard players set @s LastAir 2
execute if block ~ ~ ~ #derpcraft:all/airs run scoreboard players set @s InFluid -1
execute if block ~ ~ ~ minecraft:water run scoreboard players set @s InFluid 0
execute if block ~ ~ ~ minecraft:lava run scoreboard players set @s InFluid 1
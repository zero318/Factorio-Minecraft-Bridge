scoreboard players set @s MusicTimer -1
scoreboard players set @s AreaMusic 0
scoreboard players set @s Music 0
execute unless score @s Biome matches 14..15 run stopsound @s record
scoreboard players set @s Biome -1
#
#GameOverSFX
#
execute if score @s YouAreDead matches 1 run function derpcraft:music/core/sub_gameover
scoreboard players set @e[distance=0,limit=1,sort=nearest,scores={YouAreDead=2..},type=minecraft:player] YouAreDead 0
execute store result score @s YPos run data get entity @s Pos[1] 100
execute store result score @s YTile run data get entity @s yTile 100
execute if score @s YPos < @s YTile run scoreboard players remove @s YTile 100
execute if score @s YPos >= @s YTile run scoreboard players operation @s YPos -= @s YTile
execute if score @s YPos matches 50.. as @e[tag=PortalBaseTemp] at @s run teleport ~ ~1 ~
execute store result score @s XPos run data get entity @s Pos[0] 100
execute store result score @s XTile run data get entity @s xTile 100
execute if score @s XPos < @s XTile run scoreboard players remove @s XTile 100
execute if score @s XPos >= @s XTile run scoreboard players operation @s XPos -= @s XTile
execute as @e[tag=PortalBaseTemp] at @s run teleport ~ ~ ~0.5
execute if score @s XPos matches 50.. as @e[tag=PortalBaseTemp] at @s run teleport ~1 ~ ~
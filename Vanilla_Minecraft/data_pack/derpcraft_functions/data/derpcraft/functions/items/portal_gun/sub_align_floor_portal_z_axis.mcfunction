execute store result score @s ZPos run data get entity @s Pos[2] 100
execute store result score @s ZTile run data get entity @s zTile 100
execute if score @s ZPos < @s ZTile run scoreboard players remove @s ZTile 100
execute if score @s ZPos >= @s ZTile run scoreboard players operation @s ZPos -= @s ZTile
execute as @e[tag=PortalBaseTemp] at @s run teleport ~0.5 ~ ~
execute if score @s ZPos matches 50.. as @e[tag=PortalBaseTemp] at @s run teleport ~ ~ ~1
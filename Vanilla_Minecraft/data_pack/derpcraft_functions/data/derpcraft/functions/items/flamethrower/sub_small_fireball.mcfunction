scoreboard players set @s CarrotOnAStick 0
scoreboard players remove @s[gamemode=!creative] FlamethrowerAmmo 1
execute anchored eyes run tp @e[tag=PlayerRelative] ^ ^ ^0.25 facing ^ ^ ^0.5
summon minecraft:small_fireball ~ ~1.62 ~ {direction:[0.0,0.0,0.0],Tags:["FlamethrowerTemp","Flamethrower","FT_Small_Fireball"]}
playsound minecraft:entity.ghast.shoot player @s
execute as @e[tag=FlamethrowerTemp] store result score @s XPos run data get entity @s Pos[0] 1000
execute as @e[tag=FlamethrowerTemp] store result score @s YPos run data get entity @s Pos[1] 1000
execute as @e[tag=FlamethrowerTemp] store result score @s ZPos run data get entity @s Pos[2] 1000
execute as @e[tag=PlayerRelative] store result score @s XPos run data get entity @s Pos[0] 1000
execute as @e[tag=PlayerRelative] store result score @s YPos run data get entity @s Pos[1] 1000
execute as @e[tag=PlayerRelative] store result score @s ZPos run data get entity @s Pos[2] 1000
execute as @e[tag=FlamethrowerTemp] store result entity @s direction[0] double 0.0025 run scoreboard players operation @e[tag=PlayerRelative] XPos -= @s XPos
execute as @e[tag=FlamethrowerTemp] store result entity @s direction[1] double 0.0025 run scoreboard players operation @e[tag=PlayerRelative] YPos -= @s YPos
execute as @e[tag=FlamethrowerTemp] store result entity @s direction[2] double 0.0025 run scoreboard players operation @e[tag=PlayerRelative] ZPos -= @s ZPos
tag @e[tag=FlamethrowerTemp] remove FlamethrowerTemp
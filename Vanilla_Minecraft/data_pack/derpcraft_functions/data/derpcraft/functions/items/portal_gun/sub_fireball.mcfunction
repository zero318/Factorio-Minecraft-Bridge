scoreboard players remove @s[gamemode=!creative] FlamethrowerAmmo 250
execute anchored eyes run tp @e[tag=PlayerRelative] ^ ^ ^0.25 facing ^ ^ ^0.5
summon minecraft:fireball ~ ~1.62 ~ {ExplosionPower:25,direction:[0.0,0.0,0.0],Tags:["FlamethrowerTemp","Flamethrower","FT_Fireball"]}
playsound minecraft:entity.ghast.shoot player @s
execute as @e[tag=FlamethrowerTemp] store result score @s XPos run data get entity @s Pos[0] 1000
execute as @e[tag=FlamethrowerTemp] store result score @s YPos run data get entity @s Pos[1] 1000
execute as @e[tag=FlamethrowerTemp] store result score @s ZPos run data get entity @s Pos[2] 1000
execute as @e[tag=PlayerRelative] store result score @s XPos run data get entity @s Pos[0] 1000
execute as @e[tag=PlayerRelative] store result score @s YPos run data get entity @s Pos[1] 1000
execute as @e[tag=PlayerRelative] store result score @s ZPos run data get entity @s Pos[2] 1000
execute as @e[tag=FlamethrowerTemp] store result entity @s power[0] double 0.001 run scoreboard players operation @e[tag=PlayerRelative] XPos -= @s XPos
execute as @e[tag=FlamethrowerTemp] store result entity @s power[1] double 0.001 run scoreboard players operation @e[tag=PlayerRelative] YPos -= @s YPos
execute as @e[tag=FlamethrowerTemp] store result entity @s power[2] double 0.001 run scoreboard players operation @e[tag=PlayerRelative] ZPos -= @s ZPos
tag @e[tag=FlamethrowerTemp] remove FlamethrowerTemp
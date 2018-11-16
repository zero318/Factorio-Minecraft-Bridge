execute as @p at @s run summon minecraft:small_fireball ~ ~1.62 ~ {ExplosionPower:0,direction:[0.0,0.0,0.0],Tags:["TestFireball"]}
execute as @e[tag=TestFireball] store result score @s XPos run data get entity @s Pos[0] 1000
execute as @e[tag=TestFireball] store result score @s YPos run data get entity @s Pos[1] 1000
execute as @e[tag=TestFireball] store result score @s ZPos run data get entity @s Pos[2] 1000
execute as @e[tag=PlayerRelative] store result score @s XPos run data get entity @s Pos[0] 1000
execute as @e[tag=PlayerRelative] store result score @s YPos run data get entity @s Pos[1] 1000
execute as @e[tag=PlayerRelative] store result score @s ZPos run data get entity @s Pos[2] 1000
execute as @e[tag=TestFireball] store result entity @s power[0] double 0.001 run scoreboard players operation @e[tag=PlayerRelative] XPos -= @s XPos
execute as @e[tag=TestFireball] store result entity @s power[1] double 0.001 run scoreboard players operation @e[tag=PlayerRelative] YPos -= @s YPos
execute as @e[tag=TestFireball] store result entity @s power[2] double 0.001 run scoreboard players operation @e[tag=PlayerRelative] ZPos -= @s ZPos
tag @e[tag=TestFireball] remove TestFireball
execute at @e[tag=BulletSummon] run summon minecraft:shulker_bullet ~ ~ ~ {NoGravity:1,Steps:1,Target:{L:0,M:0,X:0,Y:0,Z:0},Tags:["TestBullet"]}
execute at @e[tag=TestBullet] run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1,Invulnerable:1,Marker:1,Invisible:1,Silent:1,Tags:["TestBulletDummy"]}
execute as @e[tag=TestBullet] store result score @s XPos run data get entity @s Pos[0] 1
execute as @e[tag=TestBullet] store result score @s YPos run data get entity @s Pos[1] 1
execute as @e[tag=TestBullet] store result score @s ZPos run data get entity @s Pos[2] 1
execute as @e[tag=BulletTarget] store result score @s XPos run data get entity @s Pos[0] 1
execute as @e[tag=BulletTarget] store result score @s YPos run data get entity @s Pos[1] 1
execute as @e[tag=BulletTarget] store result score @s ZPos run data get entity @s Pos[2] 1
execute as @e[tag=TestBullet] store result entity @s TXD double 1 run scoreboard players operation @e[tag=BulletTarget] XPos -= @s XPos
execute as @e[tag=TestBullet] store result entity @s TYD double 1 run scoreboard players operation @e[tag=BulletTarget] YPos -= @s YPos
execute as @e[tag=TestBullet] store result entity @s TZD double 1 run scoreboard players operation @e[tag=BulletTarget] ZPos -= @s ZPos
execute at @e[tag=TestBulletDummy] run summon minecraft:small_fireball ~ ~ ~ {direction:[0.0,0.0,0.0],Tags:["TestFireball"]}
kill @e[tag=TestBulletDummy]
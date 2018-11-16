tag @s add BlueWarp
tag @e[tag=!NoPortal,tag=!OutPortal,distance=..1] add WarpTargets
execute as @e[tag=WarpTargets] store result score @s XMot run data get entity @s Motion[0]
execute as @e[tag=WarpTargets] store result score @s YMot run data get entity @s Motion[1]
execute as @e[tag=WarpTargets] store result score @s ZMot run data get entity @s Motion[2]
execute as @e[tag=WarpTargets] store result score @s Yaw run data get entity @s Rotation[0]
execute as @e[tag=WarpTargets] store result score @s Pitch run data get entity @s Rotation[1]
execute at @s as @e[tag=Portal,tag=OrangePortal,distance=0.1..] if score @s DerpcraftOwner = @e[tag=BlueWarp,limit=1] DerpcraftOwner run tag @s add OrangeWarp
execute unless entity @e[tag=OrangeWarp,tag=Down] at @e[tag=OrangeWarp] run tp @e[tag=WarpTargets] ~ ~ ~
execute if entity @e[tag=OrangeWarp,tag=Down] at @e[tag=OrangeWarp] positioned ~ ~-2 ~ run tp @e[tag=WarpTargets] ~ ~ ~
execute at @e[tag=OrangeWarp] run tag @e[tag=WarpTargets,distance=..1] add OutPortal
scoreboard players reset @e[tag=WarpTargets] XMot
scoreboard players reset @e[tag=WarpTargets] YMot
scoreboard players reset @e[tag=WarpTargets] ZMot
scoreboard players reset @e[tag=WarpTargets] Yaw
scoreboard players reset @e[tag=WarpTargets] Pitch
tag @e[tag=WarpTargets] remove WarpTargets
tag @e[tag=OrangeWarp] remove OrangeWarp
tag @s remove BlueWarp
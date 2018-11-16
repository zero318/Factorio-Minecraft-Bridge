execute store result score PrevXPos Temp2 run scoreboard players get XPos Temp2
execute store result score PrevYPos Temp2 run scoreboard players get YPos Temp2
execute store result score PrevZPos Temp2 run scoreboard players get ZPos Temp2
execute store result score PrevYRot Temp2 run scoreboard players get YRot Temp2
execute store result score PrevXRot Temp2 run scoreboard players get XRot Temp2
execute store result score XPos Temp2 run data get entity @s Pos[0] 10000
execute store result score YPos Temp2 run data get entity @s Pos[1] 10000
execute store result score ZPos Temp2 run data get entity @s Pos[2] 10000
execute store result score YRot Temp2 run data get entity @s Rotation[0] 10000
execute store result score XRot Temp2 run data get entity @s Rotation[1] 10000
execute store result score XMot Temp2 run data get entity @s Motion[0] 10000
execute store result score YMot Temp2 run data get entity @s Motion[1] 10000
execute store result score ZMot Temp2 run data get entity @s Motion[2] 10000
execute store result score XPSpd Temp2 run data get entity @s Pos[0] 10000
execute store result score YPSpd Temp2 run data get entity @s Pos[1] 10000
execute store result score ZPSpd Temp2 run data get entity @s Pos[2] 10000
execute store result score YRSpd Temp2 run data get entity @s Rotation[0] 10000
execute store result score XRSpd Temp2 run data get entity @s Rotation[1] 10000
scoreboard players operation XPSpd Temp2 -= PrevXPos Temp2
scoreboard players operation YPSpd Temp2 -= PrevYPos Temp2
scoreboard players operation ZPSpd Temp2 -= PrevZPos Temp2
scoreboard players operation YRSpd Temp2 -= PrevYRot Temp2
scoreboard players operation XRSpd Temp2 -= PrevXRot Temp2
execute if score XPSpd Temp2 matches ..-1 run scoreboard players operation XPSpd Temp2 *= -1 -1
execute if score YPSpd Temp2 matches ..-1 run scoreboard players operation YPSpd Temp2 *= -1 -1
execute if score ZPSpd Temp2 matches ..-1 run scoreboard players operation ZPSpd Temp2 *= -1 -1
execute if score YRSpd Temp2 matches ..-1 run scoreboard players operation YRSpd Temp2 *= -1 -1
execute if score XRSpd Temp2 matches ..-1 run scoreboard players operation XRSpd Temp2 *= -1 -1
execute store result score XPSpd2 Temp2 run scoreboard players get XPSpd Temp2
execute store result score YPSpd2 Temp2 run scoreboard players get YPSpd Temp2
execute store result score ZPSpd2 Temp2 run scoreboard players get ZPSpd Temp2
execute store result score YRSpd2 Temp2 run scoreboard players get YRSpd Temp2
execute store result score XRSpd2 Temp2 run scoreboard players get XRSpd Temp2
#
execute store result score HPSpd Temp2 run scoreboard players operation XPSpd2 Temp2 *= XPSpd2 Temp2
execute store result score TPSpd Temp2 run scoreboard players operation YPSpd2 Temp2 *= YPSpd2 Temp2
scoreboard players operation ZPSpd2 Temp2 *= ZPSpd2 Temp2
scoreboard players operation YRSpd2 Temp2 *= YRSpd2 Temp2
scoreboard players operation XRSpd2 Temp2 *= XRSpd2 Temp2
scoreboard players operation HPSpd Temp2 += ZPSpd2 Temp2
scoreboard players operation TPSpd Temp2 += HPSpd Temp2
#
#
tellraw @s ""
tellraw @s [{"text":"XPos: "},{"score":{"objective":"Temp2","name":"XPos"}},{"text":" | YPos: "},{"score":{"objective":"Temp2","name":"YPos"}},{"text":" | ZPos: "},{"score":{"objective":"Temp2","name":"ZPos"}}]
tellraw @s [{"text":"YRot: "},{"score":{"objective":"Temp2","name":"YRot"}},{"text":" | XRot: "},{"score":{"objective":"Temp2","name":"XRot"}}]
tellraw @s [{"text":"XPSpd: "},{"score":{"objective":"Temp2","name":"XPSpd"}},{"text":" | XPSpd^2: "},{"score":{"objective":"Temp2","name":"XPSpd2"}}]
tellraw @s [{"text":"YPSpd: "},{"score":{"objective":"Temp2","name":"YPSpd"}},{"text":" | YPSpd^2: "},{"score":{"objective":"Temp2","name":"YPSpd2"}}]
tellraw @s [{"text":"ZPSpd: "},{"score":{"objective":"Temp2","name":"ZPSpd"}},{"text":" | ZPSpd^2: "},{"score":{"objective":"Temp2","name":"ZPSpd2"}}]
tellraw @s [{"text":"YRSpd: "},{"score":{"objective":"Temp2","name":"YRSpd"}},{"text":" | YRSpd^2: "},{"score":{"objective":"Temp2","name":"YRSpd2"}}]
tellraw @s [{"text":"XRSpd: "},{"score":{"objective":"Temp2","name":"XRSpd"}},{"text":" | XRSpd^2: "},{"score":{"objective":"Temp2","name":"XRSpd2"}}]
tellraw @s [{"text":"HPSpd^2: "},{"score":{"objective":"Temp2","name":"HPSpd"}}]
tellraw @s [{"text":"TPSpd^2: "},{"score":{"objective":"Temp2","name":"TPSpd"}}]
tellraw @s [{"text":"            1234567890"}]
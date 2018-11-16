execute store result score @s XPos run data get entity @s Pos[0]
execute store result score @s YPos run data get entity @s Pos[1]
execute store result score @s ZPos run data get entity @s Pos[2]
execute store result score @s XTile run data get entity @s xTile
execute store result score @s YTile run data get entity @s yTile
execute store result score @s ZTile run data get entity @s zTile
execute store result score @s Yaw run data get entity @s Passengers[0].Item.tag.ShooterRotation[0]
#execute store result score @s Pitch run data get entity @s Passengers[0].Item.tag.ShooterRotation[1]
execute if score @s XPos = @s XTile if score @s YPos > @s YTile if score @s ZPos = @s ZTile align y positioned ~ ~0.01 ~ run summon minecraft:armor_stand ~ ~ ~ {Pose:{Head:[0.0f,0.1f,0.0f]},Tags:["PortalTemp","Portal","FloorPortal","Up","NoPortal","OrangePortal"],Invulnerable:1,Marker:1,NoGravity:1,NoBasePlate:1,Invisible:1,Silent:1,ArmorItems:[{},{},{},{id:"minecraft:leather_leggings",Count:1,tag:{Damage:2,Unbreakable:1,Linked:0,display:{color:16351261}}}]}
execute if score @s XPos = @s XTile if score @s YPos < @s YTile if score @s ZPos = @s ZTile align y positioned ~ ~0.99 ~ run summon minecraft:armor_stand ~ ~ ~ {Pose:{Head:[0.0f,0.1f,0.0f]},Tags:["PortalTemp","Portal","FloorPortal","Down","NoPortal","OrangePortal"],Invulnerable:1,Marker:1,NoGravity:1,NoBasePlate:1,Invisible:1,Silent:1,ArmorItems:[{},{},{},{id:"minecraft:leather_leggings",Count:1,tag:{Damage:2,Unbreakable:1,Linked:0,display:{color:16351261}}}]}
execute if score @s XPos > @s XTile if score @s YPos = @s YTile if score @s ZPos = @s ZTile align xyz positioned ~0.01 ~ ~0.5 run summon minecraft:armor_stand ~ ~ ~ {Rotation:[270.0f,0.0f],Tags:["PortalTemp","Portal","WallPortal","East","NoPortal","OrangePortal"],Invulnerable:1,Marker:1,NoGravity:1,NoBasePlate:1,Invisible:1,Silent:1,ArmorItems:[{},{},{},{id:"minecraft:leather_boots",Count:1,tag:{Damage:2,Unbreakable:1,Linked:0,display:{color:16351261}}}]}
execute if score @s XPos < @s XTile if score @s YPos = @s YTile if score @s ZPos = @s ZTile align xyz positioned ~0.99 ~ ~0.5 run summon minecraft:armor_stand ~ ~ ~ {Rotation:[90.0f,0.0f],Tags:["PortalTemp","Portal","WallPortal","West","NoPortal","OrangePortal"],Invulnerable:1,Marker:1,NoGravity:1,NoBasePlate:1,Invisible:1,Silent:1,ArmorItems:[{},{},{},{id:"minecraft:leather_boots",Count:1,tag:{Damage:2,Unbreakable:1,Linked:0,display:{color:16351261}}}]}
execute if score @s XPos = @s XTile if score @s YPos = @s YTile if score @s ZPos > @s ZTile align xyz positioned ~0.5 ~ ~0.01 run summon minecraft:armor_stand ~ ~ ~ {Rotation:[0.0f,0.0f],Tags:["PortalTemp","Portal","WallPortal","South","NoPortal","OrangePortal"],Invulnerable:1,Marker:1,NoGravity:1,NoBasePlate:1,Invisible:1,Silent:1,ArmorItems:[{},{},{},{id:"minecraft:leather_boots",Count:1,tag:{Damage:2,Unbreakable:1,Linked:0,display:{color:16351261}}}]}
execute if score @s XPos = @s XTile if score @s YPos = @s YTile if score @s ZPos < @s ZTile align xyz positioned ~0.5 ~ ~0.99 run summon minecraft:armor_stand ~ ~ ~ {Rotation:[180.0f,0.0f],Tags:["PortalTemp","Portal","WallPortal","North","NoPortal","OrangePortal"],Invulnerable:1,Marker:1,NoGravity:1,NoBasePlate:1,Invisible:1,Silent:1,ArmorItems:[{},{},{},{id:"minecraft:leather_boots",Count:1,tag:{Damage:2,Unbreakable:1,Linked:0,display:{color:16351261}}}]}
#
execute store result score @s XPos run data get entity @s Pos[0] 100
execute store result score @s YPos run data get entity @s Pos[1] 100
execute store result score @s ZPos run data get entity @s Pos[2] 100
execute store result score @s XTile run data get entity @s xTile 100
execute store result score @s YTile run data get entity @s yTile 100
execute store result score @s ZTile run data get entity @s zTile 100
#
execute store result score @e[tag=PortalTemp,limit=1] DerpcraftOwner run scoreboard players get @s DerpcraftOwner
execute store result entity @e[tag=PortalTemp,limit=1] ArmorItems[3].tag.display.color int 1 run data get entity @s Color
execute if entity @e[tag=PortalTemp,tag=FloorPortal] store result entity @e[tag=PortalTemp,tag=FloorPortal,limit=1] Rotation[0] float 1 run scoreboard players get @s Yaw
execute if entity @e[tag=PortalTemp,tag=FloorPortal] store result entity @e[tag=PortalTemp,tag=FloorPortal,limit=1] Pose.Head[1] float 1 run scoreboard players get @s Yaw
kill @e[tag=PortalProjectile,tag=OrangePortal,limit=2,sort=nearest]
execute if entity @e[tag=PortalTemp] at @e[tag=PortalTemp] as @e[tag=Portal,tag=!PortalTemp,tag=OrangePortal] if score @s DerpcraftOwner = @e[tag=PortalTemp,limit=1] DerpcraftOwner run kill @s
execute if entity @e[tag=PortalTemp] at @e[tag=PortalTemp] as @e[tag=Portal,tag=!PortalTemp,tag=BluePortal] if score @s DerpcraftOwner = @e[tag=PortalTemp,limit=1] DerpcraftOwner store result entity @e[tag=PortalTemp,limit=1] ArmorItems[3].tag.Damage int 1 store success entity @s ArmorItems[3].tag.Damage int 1 if entity @s
tag @e[tag=PortalTemp] remove PortalTemp
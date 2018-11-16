tag @s remove LastShotBlue
tag @s remove LastShotOrange
scoreboard players set @s CarrotOnAStick 0
execute anchored eyes run tp @e[tag=PlayerRelative] ^ ^ ^0.25 facing ^ ^ ^0.5
summon minecraft:arrow ~ ~1.62 ~ {Tags:["PortalBulletTemp","PortalProjectileTemp","PortalBullet","PortalProjectile","NoPortal","BluePortal"],damage:0,life:1195,Invulnerable:1,NoGravity:1,Silent:0,Color:3949738,Passengers:[{id:"minecraft:item",Age:5995,PickupDelay:32767,Invulnerable:1,Item:{id:"minecraft:leather_boots",Count:1,tag:{Damage:2,Unbreakable:1,Temp:{X:0,Y:0,Z:0},ShooterRotation:[0.0f,0.0f],display:{color:3949738}}},Tags:["PortalItemTemp","PortalProjectileTemp","PortalItem","PortalProjectile","NoPortal","BluePortal"]}]}
execute if score @s PortalMainColor matches 0.. store result entity @e[tag=PortalBulletTemp,limit=1] Color int 1 run scoreboard players get @s PortalMainColor
execute if score @s PortalMainColor matches 0.. store result entity @e[tag=PortalBulletTemp,limit=1] Passengers[0].Item.tag.display.color int 1 run scoreboard players get @s PortalMainColor
execute store result entity @e[tag=PortalBulletTemp,limit=1] Passengers[0].Item.tag.ShooterRotation[0] float 1 run data get entity @s Rotation[0]
execute store result entity @e[tag=PortalBulletTemp,limit=1] Passengers[0].Item.tag.ShooterRotation[1] float 1 run data get entity @s Rotation[1]
scoreboard players operation @e[tag=PortalProjectileTemp] DerpcraftOwner = @s DerpcraftID
#playsound minecraft:entity.ghast.shoot player @s
execute as @e[tag=PortalBulletTemp] store result score @s XPos run data get entity @s Pos[0] 1000
execute as @e[tag=PortalBulletTemp] store result score @s YPos run data get entity @s Pos[1] 1000
execute as @e[tag=PortalBulletTemp] store result score @s ZPos run data get entity @s Pos[2] 1000
execute as @e[tag=PlayerRelative] store result score @s XPos run data get entity @s Pos[0] 1000
execute as @e[tag=PlayerRelative] store result score @s YPos run data get entity @s Pos[1] 1000
execute as @e[tag=PlayerRelative] store result score @s ZPos run data get entity @s Pos[2] 1000
execute as @e[tag=PortalBulletTemp] store result entity @s Motion[0] double 0.025 run scoreboard players operation @e[tag=PlayerRelative] XPos -= @s XPos
execute as @e[tag=PortalBulletTemp] store result entity @s Motion[1] double 0.025 run scoreboard players operation @e[tag=PlayerRelative] YPos -= @s YPos
execute as @e[tag=PortalBulletTemp] store result entity @s Motion[2] double 0.025 run scoreboard players operation @e[tag=PlayerRelative] ZPos -= @s ZPos
scoreboard players reset @e[tag=PortalBulletTemp] XPos
scoreboard players reset @e[tag=PortalBulletTemp] YPos
scoreboard players reset @e[tag=PortalBulletTemp] ZPos
execute at @e[tag=PortalBulletTemp] as @e[tag=PortalBullet,tag=BluePortal,distance=0.1..] if score @s DerpcraftOwner = @e[tag=PortalBulletTemp,limit=1] DerpcraftOwner at @s run kill @e[tag=PortalProjectile,limit=2,sort=nearest]
tag @e[tag=PortalProjectileTemp] remove PortalProjectileTemp
tag @e[tag=PortalBulletTemp] remove PortalBulletTemp
tag @e[tag=PortalItemTemp] remove PortalItemTemp
tag @s add LastShotBlue
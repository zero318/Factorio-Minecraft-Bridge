execute if score @e[tag=SpiderBossRadius,limit=1] ArenaTracker matches 0 as @e[tag=SpiderBossRadius,limit=1] at @s if block -118 56 -152 minecraft:air if entity @a[distance=..8,gamemode=!spectator] run scoreboard players set @e[tag=SpiderBossRadius,scores={ArenaTracker=0}] ArenaTracker 1
execute as @e[tag=SpiderBossRadius,scores={ArenaTracker=1}] at @s run fill -138 69 -136 -157 56 -136 minecraft:cobweb replace air
execute as @e[tag=SpiderBossRadius,scores={ArenaTracker=1}] at @s run fill -138 69 -135 -157 56 -135 minecraft:barrier replace air
execute as @e[tag=SpiderBossRadius,scores={ArenaTracker=1}] at @e[tag=SpiderBossTimer] run teleport @e[tag=SpiderBossTimer] ~ 59 ~
scoreboard players set @e[tag=SpiderBossRadius,scores={ArenaTracker=1}] ArenaTracker 2
execute if score @e[tag=SpiderBossRadius,limit=1] ArenaTracker matches 2 run tag @e[tag=IronBootsFrame] remove IronBoots
execute as @e[tag=SpiderBossTimer] at @s if block ~ ~-1 ~ minecraft:mossy_cobblestone run scoreboard players set @e[tag=SpiderBossRadius,scores={ArenaTracker=2}] ArenaTracker 3
execute if score @e[tag=SpiderBossRadius,limit=1] ArenaTracker matches 3 at @e[tag=SummonCaveSpider+Z] run summon cave_spider ~ ~ ~ {Motion:[0.0,0.45,1.35],DeathLootTable:empty,Tags:["BossSpiderSlave"],Team:SpiderBoss,Rotation:[0.0,0.0],Attributes:[{Name:generic.maxHealth,Base:10},{Name:generic.attackDamage,Base:0.5d},{Name:generic.movementSpeed,Base:0.275d}],Health:10}
execute if score @e[tag=SpiderBossRadius,limit=1] ArenaTracker matches 3 at @e[tag=SummonCaveSpider+X] run summon cave_spider ~ ~ ~ {Motion:[1.35,0.45,0.0],DeathLootTable:empty,Tags:["BossSpiderSlave"],Team:SpiderBoss,Rotation:[-90.0,0.0],Attributes:[{Name:generic.maxHealth,Base:10},{Name:generic.attackDamage,Base:0.5d},{Name:generic.movementSpeed,Base:0.275d}],Health:10}
execute if score @e[tag=SpiderBossRadius,limit=1] ArenaTracker matches 3 at @e[tag=SummonCaveSpider-X] run summon cave_spider ~ ~ ~ {Motion:[-1.35,0.45,0.0],DeathLootTable:empty,Tags:["BossSpiderSlave"],Team:SpiderBoss,Rotation:[90.0,0.0],Attributes:[{Name:generic.maxHealth,Base:10},{Name:generic.attackDamage,Base:0.5d},{Name:generic.movementSpeed,Base:0.275d}],Health:10}
scoreboard players set @e[tag=SpiderBossRadius,scores={ArenaTracker=3}] ArenaTracker 4
effect clear @a[x=-160,y=51,z=-170,dx=41,dy=21,dz=34] minecraft:poison
scoreboard players set @e[tag=SpiderBossRadius,scores={ArenaTracker=4}] ArenaTracker 5
execute if score @e[tag=SpiderBossRadius,limit=1] ArenaTracker matches 5 as @e[x=-160,y=51,z=-170,dx=41,dy=21,dz=34,tag=BossSpiderSlave] run scoreboard players set @e[tag=SpiderBossRadius,scores={ArenaTracker=5}] ArenaTracker 4
execute as @e[tag=SpiderBossRadius,scores={ArenaTracker=5}] at @e[tag=SpiderBossTimer] run teleport @e[tag=SpiderBossTimer] ~ 59 ~
scoreboard players set @e[tag=SpiderBossRadius,scores={ArenaTracker=5}] ArenaTracker 6
execute as @e[tag=SpiderBossTimer] at @s if block ~ ~-1 ~ minecraft:mossy_cobblestone run scoreboard players set @e[tag=SpiderBossRadius,scores={ArenaTracker=6}] ArenaTracker 7
execute as @e[tag=SpiderBossRadius,scores={ArenaTracker=7}] at @s run summon spider ~ ~6 ~ {Glowing:1,CustomNameVisible:1,DeathLootTable:empty,HandItems:[{id:"minecraft:wooden_axe",Count:1,tag:{AttributeModifiers:[{AttributeName:"generic.attackDamage",Name:"generic.attackDamage",Amount:0,Operation:0,UUIDLeast:1,UUIDMost:1}]}}],Attributes:[{Name:generic.maxHealth,Base:100},{Name:generic.attackDamage,Base:5},{Name:generic.followRange,Base:40},{Name:generic.knockbackResistance,Base:0.75},{Name:generic.armor,Base:4},{Name:generic.movementSpeed,Base:0.4}],Health:100.0f,Tags:["SpiderBoss"],Team:SpiderBoss}
scoreboard players set @e[tag=SpiderBossRadius,scores={ArenaTracker=7}] ArenaTracker 8
scoreboard players set @e[tag=SpiderBossRadius,scores={ArenaTracker=8}] ArenaTracker 9
execute as @e[tag=SpiderBossRadius,scores={ArenaTracker=9}] at @s run execute as @e[x=-160,y=51,z=-170,dx=41,dy=21,dz=34,tag=SpiderBoss] at @s run scoreboard players set @e[tag=SpiderBossRadius,scores={ArenaTracker=9}] ArenaTracker 8
execute as @e[tag=SpiderBossRadius,scores={ArenaTracker=9}] at @s run title @a[x=-160,y=51,z=-170,dx=41,dy=21,dz=34,gamemode=!spectator] title {"text":"You win!"}
execute as @e[tag=SpiderBossRadius,scores={ArenaTracker=9}] at @s run tag @e[tag=IronBootsFrame] add IronBoots
execute as @e[tag=SpiderBossRadius,scores={ArenaTracker=9}] at @s run fill -138 69 -136 -157 56 -136 minecraft:air replace minecraft:cobweb
execute as @e[tag=SpiderBossRadius,scores={ArenaTracker=9}] at @s run fill -138 69 -135 -157 56 -135 minecraft:air replace minecraft:barrier
execute as @e[tag=SpiderBossRadius,scores={ArenaTracker=9}] at @s run setblock -118 56 -152 minecraft:white_glazed_terracotta[facing=south]
scoreboard players set @e[tag=SpiderBossRadius,scores={ArenaTracker=9}] ArenaTracker 0
scoreboard players operation @e[tag=SpiderBossRadius,scores={ArenaTracker=1..9}] ArenaTracker *= -1 -1
execute as @e[x=-160,y=51,z=-170,dx=41,dy=21,dz=34,gamemode=!spectator,limit=1,sort=nearest] at @s run scoreboard players operation @e[tag=SpiderBossRadius,scores={ArenaTracker=-9..-1}] ArenaTracker *= -1 -1
execute as @e[tag=SpiderBossRadius,scores={ArenaTracker=-9..-1}] at @s run title @a[x=-160,y=51,z=-170,dx=41,dy=21,dz=34] title {"text":"You lose!"}
scoreboard players set @e[tag=SpiderBossRadius,scores={ArenaTracker=-9..-1}] ArenaTracker -10
execute as @e[tag=SpiderBossRadius,scores={ArenaTracker=-10}] run teleport @e[tag=SpiderBossTimer] ~ 59 ~
scoreboard players set @e[tag=SpiderBossRadius,scores={ArenaTracker=-10}] ArenaTracker -11
execute as @e[tag=SpiderBossTimer] at @s if block ~ ~-1 ~ minecraft:mossy_cobblestone run scoreboard players set @e[tag=SpiderBossRadius,scores={ArenaTracker=-11}] ArenaTracker -12
execute as @e[tag=SpiderBossRadius,scores={ArenaTracker=-12}] at @s run fill -138 69 -136 -157 56 -136 minecraft:air replace minecraft:cobweb
execute as @e[tag=SpiderBossRadius,scores={ArenaTracker=-12}] at @s run fill -138 69 -135 -157 56 -135 minecraft:air replace minecraft:barrier
execute as @e[tag=SpiderBossRadius,scores={ArenaTracker=-12}] at @e[team=SpiderBoss] run teleport @e[team=SpiderBoss] ~ ~-255 ~
scoreboard players set @e[tag=SpiderBossRadius,scores={ArenaTracker=-12}] ArenaTracker 0
execute as @e[tag=SpiderBossRadius,scores={ArenaTracker=0}] run tag @e[tag=IronBootsFrame] add IronBoots
scoreboard players add @e[tag=SpiderBossRadius] ArenaTracker 0
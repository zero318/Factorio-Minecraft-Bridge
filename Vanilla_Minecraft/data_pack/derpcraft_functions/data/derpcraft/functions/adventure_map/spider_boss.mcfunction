execute if score SpiderBoss ArenaTracker matches 0 at @e[tag=SpiderBossRadius,limit=1] if block -118 56 -152 minecraft:air if entity @a[distance=..8,gamemode=!spectator] run scoreboard players set SpiderBoss ArenaTracker 1
execute if score SpiderBoss ArenaTracker matches 1 run fill -138 69 -136 -157 56 -136 minecraft:cobweb replace air
execute if score SpiderBoss ArenaTracker matches 1 run fill -138 69 -135 -157 56 -135 minecraft:barrier replace air
execute if score SpiderBoss ArenaTracker matches 1 run teleport @e[tag=SpiderBossTimer] -124 60 -151
execute if score SpiderBoss ArenaTracker matches 1 run tag @e[tag=IronBootsFrame,tag=IronBoots] remove IronBoots
execute if score SpiderBoss ArenaTracker matches 1 run scoreboard players set SpiderBoss ArenaTracker 2
execute if score SpiderBoss ArenaTracker matches 2 at @e[tag=SpiderBossTimer] if block ~ ~-1 ~ minecraft:mossy_cobblestone run scoreboard players set SpiderBoss ArenaTracker 3
execute if score SpiderBoss ArenaTracker matches 3 at @e[tag=SummonCaveSpider+Z] run summon cave_spider ~ ~ ~ {Motion:[0.0,0.45,1.35],DeathLootTable:empty,Tags:["SpiderBossSlave"],Team:SpiderBoss,Rotation:[0.0,0.0],ArmorItems:[{id:"minecraft:leather_boots",Count:1,tag:{Enchantments:[{lvl:2,id:"minecraft:depth_strider"},{lvl:1,id:"minecraft:vanishing_curse"}],AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:2,UUIDMost:2}]}}],Attributes:[{Base:9.0,Name:generic.maxHealth},{Base:0.25,Name:generic.attackDamage},{Base:0.275,Name:generic.movementSpeed},{Base:40.0,Name:generic.followRange}],Health:9.0,Team:SpiderBoss}
execute if score SpiderBoss ArenaTracker matches 3 at @e[tag=SummonCaveSpider+X] run summon cave_spider ~ ~ ~ {Motion:[1.35,0.45,0.0],DeathLootTable:empty,Tags:["SpiderBossSlave"],Team:SpiderBoss,Rotation:[-90.0,0.0],ArmorItems:[{id:"minecraft:leather_boots",Count:1,tag:{Enchantments:[{lvl:2,id:"minecraft:depth_strider"},{lvl:1,id:"minecraft:vanishing_curse"}],AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:2,UUIDMost:2}]}}],Attributes:[{Base:9.0,Name:generic.maxHealth},{Base:0.25,Name:generic.attackDamage},{Base:0.275,Name:generic.movementSpeed},{Base:40.0,Name:generic.followRange}],Health:9.0,Team:SpiderBoss}
execute if score SpiderBoss ArenaTracker matches 3 at @e[tag=SummonCaveSpider-X] run summon cave_spider ~ ~ ~ {Motion:[-1.35,0.45,0.0],DeathLootTable:empty,Tags:["SpiderBossSlave"],Team:SpiderBoss,Rotation:[90.0,0.0],ArmorItems:[{id:"minecraft:leather_boots",Count:1,tag:{Enchantments:[{lvl:2,id:"minecraft:depth_strider"},{lvl:1,id:"minecraft:vanishing_curse"}],AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:2,UUIDMost:2}]}}],Attributes:[{Base:9.0,Name:generic.maxHealth},{Base:0.25,Name:generic.attackDamage},{Base:0.275d,Name:generic.movementSpeed},{Base:40.0,Name:generic.followRange}],Health:9.0,Team:SpiderBoss}
execute if score SpiderBoss ArenaTracker matches 3 run scoreboard players set SpiderBoss ArenaTracker 4
execute if score SpiderBoss ArenaTracker matches 4 run effect clear @a[x=-160,y=51,z=-170,dx=41,dy=21,dz=34] minecraft:poison
execute if score SpiderBoss ArenaTracker matches 4 unless entity @e[x=-160,y=51,z=-170,dx=41,dy=21,dz=34,tag=SpiderBossSlave] run scoreboard players set SpiderBoss ArenaTracker 5
#execute if score SpiderBoss ArenaTracker matches 5 if entity @e[x=-160,y=51,z=-170,dx=41,dy=21,dz=34,tag=SpiderBossSlave] run scoreboard players set SpiderBoss ArenaTracker 4
execute if score SpiderBoss ArenaTracker matches 5 run teleport @e[tag=SpiderBossTimer] -124 60 -151
execute if score SpiderBoss ArenaTracker matches 5 run scoreboard players set SpiderBoss ArenaTracker 6
execute if score SpiderBoss ArenaTracker matches 6 at @e[tag=SpiderBossTimer] if block ~ ~-1 ~ minecraft:mossy_cobblestone run scoreboard players set SpiderBoss ArenaTracker 7
execute if score SpiderBoss ArenaTracker matches 7 at @e[tag=SpiderBossRadius] run summon spider ~ ~6 ~ {Glowing:1,CustomNameVisible:1,DeathLootTable:empty,HandItems:[{id:"minecraft:wooden_axe",Count:1,tag:{Enchantments:[{lvl:1,id:"minecraft:vanishing_curse"}],AttributeModifiers:[{AttributeName:"generic.attackDamage",Name:"generic.attackDamage",Amount:0,Operation:0,UUIDLeast:1,UUIDMost:1}]}}],ArmorItems:[{id:"minecraft:leather_boots",Count:1,tag:{Enchantments:[{lvl:2,id:"minecraft:depth_strider"},{lvl:1,id:"minecraft:vanishing_curse"}],AttributeModifiers:[{AttributeName:"generic.armor",Name:"generic.armor",Amount:0,Operation:0,UUIDLeast:2,UUIDMost:2}]}}],Attributes:[{Base:50.0,Name:generic.maxHealth},{Base:3.0,Name:generic.attackDamage},{Base:40.0,Name:generic.followRange},{Base:0.33,Name:generic.knockbackResistance},{Base:4.0,Name:generic.armor},{Base:0.35,Name:generic.movementSpeed}],Health:50.0f,Tags:["SpiderBoss"],Team:SpiderBoss}
execute if score SpiderBoss ArenaTracker matches 7 run scoreboard players set SpiderBoss ArenaTracker 8
execute if score SpiderBoss ArenaTracker matches 8 unless entity @e[x=-160,y=51,z=-170,dx=41,dy=21,dz=34,tag=SpiderBoss] run scoreboard players set SpiderBoss ArenaTracker 9
#execute if score SpiderBoss ArenaTracker matches 9 if entity @e[x=-160,y=51,z=-170,dx=41,dy=21,dz=34,tag=SpiderBoss] run scoreboard players set SpiderBoss ArenaTracker 8
execute if score SpiderBoss ArenaTracker matches 9 run title @a[x=-160,y=51,z=-170,dx=41,dy=21,dz=34,gamemode=!spectator] title {"text":"You win!","color":"dark_green"}
execute if score SpiderBoss ArenaTracker matches 9 run tag @e[tag=IronBootsFrame] add IronBoots
execute if score SpiderBoss ArenaTracker matches 9 run fill -138 69 -136 -157 56 -136 minecraft:air replace minecraft:cobweb
execute if score SpiderBoss ArenaTracker matches 9 run fill -138 69 -135 -157 56 -135 minecraft:air replace minecraft:barrier
execute if score SpiderBoss ArenaTracker matches 9 run setblock -118 56 -152 minecraft:white_glazed_terracotta[facing=south]
execute if score SpiderBoss ArenaTracker matches 9 run scoreboard players set SpiderBoss ArenaTracker 0
#execute if score SpiderBoss ArenaTracker matches 1..9 run scoreboard players operation SpiderBoss ArenaTracker *= -1 -1
#execute if score SpiderBoss ArenaTracker matches -9..-1 if entity @e[x=-160,y=51,z=-170,dx=41,dy=21,dz=34,gamemode=!spectator,type=player] run scoreboard players operation SpiderBoss ArenaTracker *= -1 -1
execute if score SpiderBoss ArenaTracker matches 1..9 unless entity @e[x=-160,y=51,z=-170,dx=41,dy=21,dz=34,gamemode=!spectator,type=player] run scoreboard players set SpiderBoss ArenaTracker -10
#execute if score SpiderBoss ArenaTracker matches -9..-1 run title @a[x=-160,y=51,z=-170,dx=41,dy=21,dz=34] title {"text":"You lose!","color":"dark_red"}
execute if score SpiderBoss ArenaTracker matches -10 run title @a[x=-160,y=51,z=-170,dx=41,dy=21,dz=34] title {"text":"You lose!","color":"dark_red"}
#execute if score SpiderBoss ArenaTracker matches -9..-1 run scoreboard players set SpiderBoss ArenaTracker -10
execute if score SpiderBoss ArenaTracker matches -10 run teleport @e[tag=SpiderBossTimer] -124 60 -151
execute if score SpiderBoss ArenaTracker matches -10 run scoreboard players set SpiderBoss ArenaTracker -11
execute if score SpiderBoss ArenaTracker matches -11 at @e[tag=SpiderBossTimer] if block ~ ~-1 ~ minecraft:mossy_cobblestone run scoreboard players set SpiderBoss ArenaTracker -12
execute if score SpiderBoss ArenaTracker matches -12 run fill -138 69 -136 -157 56 -136 minecraft:air replace minecraft:cobweb
execute if score SpiderBoss ArenaTracker matches -12 run fill -138 69 -135 -157 56 -135 minecraft:air replace minecraft:barrier
execute if score SpiderBoss ArenaTracker matches -12 run teleport @e[team=SpiderBoss] ~ ~-255 ~
execute if score SpiderBoss ArenaTracker matches -12 run scoreboard players set SpiderBoss ArenaTracker 0
execute if score SpiderBoss ArenaTracker matches 0 run tag @e[tag=IronBootsFrame,tag=!IronBoots] add IronBoots
scoreboard players add SpiderBoss ArenaTracker 0
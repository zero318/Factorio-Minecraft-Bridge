#
#Setup Functions
#
execute if entity @e[type=minecraft:blaze,tag=!LunaticMode] as @e[type=minecraft:blaze,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/blaze
#
execute if entity @e[type=minecraft:cave_spider,tag=!LunaticMode] as @e[type=minecraft:cave_spider,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/cave_spider
#
execute if entity @e[type=minecraft:creeper,tag=!LunaticMode] as @e[type=minecraft:creeper,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/creeper
#
execute if entity @e[type=minecraft:drowned,tag=!LunaticMode] as @e[type=minecraft:drowned,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/drowned
#
execute if entity @e[type=minecraft:elder_guardian,tag=!LunaticMode] as @e[type=minecraft:elder_guardian,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/elder_guardian
#
execute if entity @e[type=minecraft:end_crystal,nbt={ShowBottom:1b},tag=!LunaticMode] as @e[type=minecraft:end_crystal,nbt={ShowBottom:1b},tag=!LunaticMode] at @s run function derpcraft:lunatic_mode/mobs/end_crystal
#
execute if entity @e[type=minecraft:ender_dragon,tag=!LunaticMode] as @e[type=minecraft:ender_dragon,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/ender_dragon
#
#execute if entity @e[type=minecraft:enderman,tag=!LunaticMode] as @e[type=minecraft:enderman,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/enderman
#execute if entity @e[type=minecraft:endermite,tag=!LunaticMode] as @e[type=minecraft:endermite,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/endermite
#execute if entity @e[type=minecraft:evoker,tag=!LunaticMode] as @e[type=minecraft:evoker,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/evoker
#
execute if entity @e[type=minecraft:ghast,tag=!LunaticMode] as @e[type=minecraft:ghast,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/ghast
#
#execute if entity @e[type=minecraft:giant,tag=!LunaticMode] as @e[type=minecraft:giant,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/giant
#execute if entity @e[type=minecraft:guardian,tag=!LunaticMode] as @e[type=minecraft:guardian,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/guardian
#execute if entity @e[type=minecraft:husk,tag=!LunaticMode] as @e[type=minecraft:husk,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/husk
#execute if entity @e[type=minecraft:illusioner,tag=!LunaticMode] as @e[type=minecraft:illusioner,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/illusioner
#execute if entity @e[type=minecraft:magma_cube,tag=!LunaticMode] as @e[type=minecraft:magma_cube,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/magma_cube
#
execute if entity @e[type=minecraft:phantom,tag=!LunaticMode] as @e[type=minecraft:phantom,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/phantom
#
#execute if entity @e[type=minecraft:rabbit,tag=!LunaticMode] as @e[type=minecraft:rabbit,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/rabbit
#execute if entity @e[type=minecraft:shulker,tag=!LunaticMode] as @e[type=minecraft:shulker,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/shulker
#execute if entity @e[type=minecraft:silverfish,tag=!LunaticMode] as @e[type=minecraft:silverfish,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/silverfish
#execute if entity @e[type=minecraft:skeleton,tag=!LunaticMode] as @e[type=minecraft:skeleton,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/skeleton
#execute if entity @e[type=minecraft:slime,tag=!LunaticMode] as @e[type=minecraft:slime,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/slime
#execute if entity @e[type=minecraft:spider,tag=!LunaticMode] as @e[type=minecraft:spider,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/spider
#execute if entity @e[type=minecraft:stray,tag=!LunaticMode] as @e[type=minecraft:stray,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/stray
#execute if entity @e[type=minecraft:vindicator,tag=!LunaticMode] as @e[type=minecraft:vindicator,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/vindicator
#execute if entity @e[type=minecraft:witch,tag=!LunaticMode] as @e[type=minecraft:witch,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/witch
#execute if entity @e[type=minecraft:wither,tag=!LunaticMode] as @e[type=minecraft:wither,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/wither
#execute if entity @e[type=minecraft:wither_skeleton,tag=!LunaticMode] as @e[type=minecraft:wither_skeleton,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/wither_skeleton
#execute if entity @e[type=minecraft:wolf,tag=!LunaticMode] as @e[type=minecraft:wolf,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/wolf
#execute if entity @e[type=minecraft:zombie,tag=!LunaticMode] as @e[type=minecraft:zombie,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/zombie
#execute if entity @e[type=minecraft:zombie_pigman,tag=!LunaticMode] as @e[type=minecraft:zombie_pigman,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/zombie_pigman
#execute if entity @e[type=minecraft:zombie_villager,tag=!LunaticMode] as @e[type=minecraft:zombie_villager,tag=!LunaticMode] run function derpcraft:lunatic_mode/mobs/zombie_villager
#
execute if entity @e[type=minecraft:area_effect_cloud,nbt={Particle:"minecraft:dragon_breath",Age:1,Radius:3.0f,Dimension:1},tag=!LunaticMode] as @e[type=minecraft:area_effect_cloud,nbt={Particle:"minecraft:dragon_breath",Age:1,Radius:3.0f,Dimension:1},tag=!LunaticMode] at @s run function derpcraft:lunatic_mode/mobs/dragon_breath/fireball
execute if entity @e[type=minecraft:area_effect_cloud,nbt={Particle:"minecraft:dragon_breath",Age:1,Radius:5.0f,Dimension:1},tag=!LunaticMode] as @e[type=minecraft:area_effect_cloud,nbt={Particle:"minecraft:dragon_breath",Age:1,Radius:5.0f,Dimension:1},tag=!LunaticMode] at @s run function derpcraft:lunatic_mode/mobs/dragon_breath/portal
#
#Repeating Functions
#
execute if entity @e[type=minecraft:cave_spider,tag=LunaticMode] as @e[type=minecraft:cave_spider,tag=LunaticMode] run data merge entity @s {FallDistance:0}
#
execute if entity @e[type=minecraft:creeper,tag=LunaticMode,tag=!LunaticCharged,nbt={ExplosionRadius:6b,powered:1b}] as @e[type=minecraft:creeper,tag=LunaticMode,tag=!LunaticCharged,nbt={ExplosionRadius:6b,powered:1b}] run data merge entity @s {ExplosionRadius:9,Fire:-1}
#
execute if entity @e[type=minecraft:drowned,tag=LunaticMode] as @e[type=minecraft:drowned,tag=LunaticMode] run data merge entity @s {Fire:-20s}
#
execute at @e[type=minecraft:dragon_fireball] run kill @a[distance=..1,gamemode=!creative,gamemode=!spectator]
execute if entity @e[type=minecraft:phantom,tag=LunaticMode] as @e[type=minecraft:phantom] run data merge entity @s {Fire:-20s}
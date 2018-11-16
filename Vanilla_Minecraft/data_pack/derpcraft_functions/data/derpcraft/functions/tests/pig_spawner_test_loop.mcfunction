#execute store result score @e[tag=Respawner,scores={SpawnType=1}] SpawnFound if entity @e[tag=!Respawner,scores={SpawnType=1}]
#execute store result score @e[tag=Respawner,scores={SpawnType=1,SpawnerID=1}] SpawnFound as @e[tag=!Respawner,scores={SpawnType=1}] if score @s SpawnerID = @e[tag=Respawner,limit=1,scores={SpawnType=1,SpawnerID=1}] SpawnerID
#execute store result score @e[tag=Respawner,scores={SpawnerID=1}] SpawnFound if entity @e[tag=!Respawner,scores={SpawnerID=1}]
#execute store result score @e[tag=Respawner,scores={SpawnerID=2}] SpawnFound if entity @e[tag=!Respawner,scores={SpawnerID=2}]
scoreboard players set @e[tag=Respawner] SpawnFound 0
execute as @e[tag=Respawner] as @s at @e[tag=Spawned] if score @s SpawnerID = @e[tag=Spawned,limit=1,sort=nearest] SpawnerID run scoreboard players add @s SpawnFound 1
execute as @e[tag=Respawner,scores={SpawnFound=0}] if score @s SpawnTimer < @s SpawnDelay run scoreboard players add @s SpawnTimer 1
execute as @e[tag=Respawner,scores={SpawnFound=0,SpawnType=1}] if score @s SpawnTimer = @s SpawnDelay at @s run summon minecraft:pig ~ ~ ~ {Tags:["Spawned"]}
execute as @e[tag=Respawner,scores={SpawnFound=0,SpawnType=1}] if score @s SpawnTimer = @s SpawnDelay at @s store result score @e[type=minecraft:pig,limit=1,sort=nearest,tag=Spawned] SpawnerID run scoreboard players get @e[tag=Respawner,limit=1,sort=nearest,scores={SpawnFound=0,SpawnType=1}] SpawnerID
execute as @e[tag=Respawner,scores={SpawnFound=0,SpawnType=1}] if score @s SpawnTimer = @s SpawnDelay at @s store result score @e[type=minecraft:pig,limit=1,sort=nearest,tag=Spawned] SpawnType run scoreboard players get @e[tag=Respawner,limit=1,sort=nearest,scores={SpawnFound=0,SpawnType=1}] SpawnType
execute as @e[tag=Respawner,scores={SpawnFound=0}] if score @s SpawnTimer = @s SpawnDelay run scoreboard players set @s SpawnTimer 0
execute as @a[scores={RespawnLocation=0..},gamemode=!spectator] at @s if entity @e[tag=RespawnLocation,distance=..1.5] unless score @s RespawnLocation = @e[tag=RespawnLocation,limit=1,sort=nearest] RespawnLocation run function derpcraft:adventure_map/respawn/sub_set
#
execute as @a[gamemode=!spectator] at @s if entity @e[tag=RespawnLocation,distance=..1.5] run effect give @s minecraft:instant_health 2 16 true
scoreboard players add @a RespawnLocation 0
#
execute at @e[tag=RespawnLocation,tag=!HideParticles] run particle minecraft:enchant ~ ~-0.125 ~ 0.125 0.25 0.125 0 1 force
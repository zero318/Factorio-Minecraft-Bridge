scoreboard players operation @s RespawnLocation = @e[tag=RespawnLocation,limit=1,sort=nearest] RespawnLocation
execute at @e[tag=RespawnLocation,limit=1,sort=nearest] positioned ~ ~-1 ~ run spawnpoint @s ~ ~ ~
#
execute as @e[tag=RespawnLocation,limit=1,sort=nearest] if entity @s[tag=!HideParticles] at @s run particle minecraft:enchant ~ ~ ~ 0.25 0.25 0.25 1 1000 force
execute at @e[tag=RespawnLocation,limit=1,sort=nearest] run playsound minecraft:ui.toast.challenge_complete ambient @s
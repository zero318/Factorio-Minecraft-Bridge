execute if score Trigger Temp matches 0 run data merge entity @e[tag=MotionTest,limit=1] {Motion:[0.0,0.0,0.0]}
execute if score Trigger Temp matches 0 run tp @e[tag=MotionTest] 0 60 0
execute if score Trigger Temp matches 0 store result score XP1 Temp run data get entity @e[tag=MotionTest,limit=1] Pos[0] 100
execute if score Trigger Temp matches 0 store result score YP1 Temp run data get entity @e[tag=MotionTest,limit=1] Pos[1] 100
execute if score Trigger Temp matches 0 store result score ZP1 Temp run data get entity @e[tag=MotionTest,limit=1] Pos[2] 100
#
execute if score Trigger Temp matches 0 run data merge entity @e[tag=MotionTest,limit=1] {Motion:[2.0,0.0,2.0]}
#
execute if score Trigger Temp matches 0 store result score XV1 Temp run data get entity @e[tag=MotionTest,limit=1] Motion[0] 100
execute if score Trigger Temp matches 0 store result score YV1 Temp run data get entity @e[tag=MotionTest,limit=1] Motion[1] 100
execute if score Trigger Temp matches 0 store result score ZV1 Temp run data get entity @e[tag=MotionTest,limit=1] Motion[2] 100
#
execute if score Trigger Temp matches 1 store result score XP2 Temp run data get entity @e[tag=MotionTest,limit=1] Pos[0] 100
execute if score Trigger Temp matches 1 store result score YP2 Temp run data get entity @e[tag=MotionTest,limit=1] Pos[1] 100
execute if score Trigger Temp matches 1 store result score ZP2 Temp run data get entity @e[tag=MotionTest,limit=1] Pos[2] 100
execute if score Trigger Temp matches 1 store result score XV2 Temp run data get entity @e[tag=MotionTest,limit=1] Motion[0] 100
execute if score Trigger Temp matches 1 store result score YV2 Temp run data get entity @e[tag=MotionTest,limit=1] Motion[1] 100
execute if score Trigger Temp matches 1 store result score ZV2 Temp run data get entity @e[tag=MotionTest,limit=1] Motion[2] 100
#
execute if score Trigger Temp matches 1 run scoreboard players operation XPD Temp = XP1 Temp
execute if score Trigger Temp matches 1 run scoreboard players operation YPD Temp = YP1 Temp
execute if score Trigger Temp matches 1 run scoreboard players operation ZPD Temp = ZP1 Temp
execute if score Trigger Temp matches 1 run scoreboard players operation XVD Temp = XV1 Temp
execute if score Trigger Temp matches 1 run scoreboard players operation YVD Temp = YV1 Temp
execute if score Trigger Temp matches 1 run scoreboard players operation ZVD Temp = ZV1 Temp
#
execute if score Trigger Temp matches 1 run scoreboard players operation XPD Temp -= XP2 Temp
execute if score Trigger Temp matches 1 run scoreboard players operation YPD Temp -= YP2 Temp
execute if score Trigger Temp matches 1 run scoreboard players operation ZPD Temp -= ZP2 Temp
execute if score Trigger Temp matches 1 run scoreboard players operation XVD Temp -= XV2 Temp
execute if score Trigger Temp matches 1 run scoreboard players operation YVD Temp -= YV2 Temp
execute if score Trigger Temp matches 1 run scoreboard players operation ZVD Temp -= ZV2 Temp
#
execute if score Trigger Temp matches 1 if score XPD Temp matches ..-1 run scoreboard players operation XPD Temp *= -1 -1
execute if score Trigger Temp matches 1 if score YPD Temp matches ..-1 run scoreboard players operation YPD Temp *= -1 -1
execute if score Trigger Temp matches 1 if score ZPD Temp matches ..-1 run scoreboard players operation ZPD Temp *= -1 -1
execute if score Trigger Temp matches 1 if score XVD Temp matches ..-1 run scoreboard players operation XVD Temp *= -1 -1
execute if score Trigger Temp matches 1 if score YVD Temp matches ..-1 run scoreboard players operation YVD Temp *= -1 -1
execute if score Trigger Temp matches 1 if score ZVD Temp matches ..-1 run scoreboard players operation ZVD Temp *= -1 -1
#
execute if score Trigger Temp matches 1 run scoreboard players set Trigger Temp 2
execute if score Trigger Temp matches 0 run scoreboard players set Trigger Temp 1

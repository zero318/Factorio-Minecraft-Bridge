execute store result score XV Temp run data get entity @e[tag=TestBullet,limit=1] Motion[0] 100
execute store result score YV Temp run data get entity @e[tag=TestBullet,limit=1] Motion[1] 100
execute store result score ZV Temp run data get entity @e[tag=TestBullet,limit=1] Motion[2] 100
execute store result entity @e[tag=TestFireball,limit=1] power[0] double 1 run data get entity @e[tag=TestBullet,limit=1] Motion[0] 2.5
execute store result entity @e[tag=TestFireball,limit=1] power[1] double 1 run data get entity @e[tag=TestBullet,limit=1] Motion[1] 2.5
execute store result entity @e[tag=TestFireball,limit=1] power[2] double 1 run data get entity @e[tag=TestBullet,limit=1] Motion[2] 2.5
kill @e[tag=TestBullet]
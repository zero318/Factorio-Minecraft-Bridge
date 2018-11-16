#
#Sound Areas and Tag Management
#
scoreboard players set @a[x=-28,y=56,z=4,dx=7,dy=7,dz=7] AreaMusic 0
#
#Toxic Caves and Base
#
tag @a[x=-93,y=54,z=-21,dx=3,dy=4,dz=0,tag=SecretCave] remove SecretCave
tag @a[x=-94,y=55,z=-20,dx=0,dy=3,dz=2,tag=!SecretCave] add SecretCave
tag @a[x=-87,y=58,z=-125,dx=23,dy=21,dz=0,tag=Base] remove Base
tag @a[x=-87,y=58,z=-126,dx=23,dy=21,dz=0,tag=!Base] add Base
tag @a[x=-39,y=58,z=-132,dx=4,dy=3,dz=0,tag=!Base] add Base
tag @a[x=-39,y=58,z=-131,dx=4,dy=3,dz=0,tag=Base] remove Base
scoreboard players set @a[x=-164,y=50,z=-212,dx=183,dy=23,dz=199] AreaMusic 73
scoreboard players set @a[x=-164,y=50,z=-212,dx=183,dy=23,dz=199,tag=Alt] AreaMusic 73
scoreboard players set @a[x=-164,y=50,z=-212,dx=183,dy=23,dz=199,tag=SecretCave] AreaMusic 20
scoreboard players set @a[x=-164,y=50,z=-212,dx=183,dy=23,dz=199,tag=Base] AreaMusic 75
scoreboard players set @a[x=6,y=67,z=-31,dx=8,dy=4,dz=18] AreaMusic 18
scoreboard players set @a[x=-164,y=50,z=-212,dx=183,dy=23,dz=199,tag=Boss] AreaMusic 61
execute if score SpiderBoss ArenaTracker matches 1..9 run scoreboard players set @a[x=-160,y=51,z=-170,dx=41,dy=21,dz=34] AreaMusic 54
#
#Lava Powerhouse
#
scoreboard players set @a[x=-164,y=74,z=-212,dx=183,dy=21,dz=199] AreaMusic 74
scoreboard players set @a[x=-164,y=74,z=-212,dx=183,dy=21,dz=199,tag=Alt] AreaMusic 29
scoreboard players set @a[x=-164,y=74,z=-212,dx=183,dy=21,dz=199,tag=Boss] AreaMusic 76
#
#Ice Mines
#
tag @a[x=-62,y=95,z=-99,dx=2,dy=0,dz=2,tag=Alt] remove Alt
tag @a[x=-62,y=96,z=-99,dx=2,dy=0,dz=2,tag=!Alt] add Alt
tag @a[x=15,y=97,z=-15,dx=0,dy=1,dz=0,tag=Alt] remove Alt
tag @a[x=14,y=97,z=-15,dx=0,dy=1,dz=0,tag=!Alt] add Alt
scoreboard players set @a[x=-164,y=96,z=-212,dx=183,dy=48,dz=199] AreaMusic 101
scoreboard players set @a[x=15,y=96,z=-16,dx=4,dy=47,dz=3] AreaMusic 18
scoreboard players set @a[x=-164,y=96,z=-212,dx=183,dy=48,dz=199,tag=Alt] AreaMusic 19
scoreboard players set @a[x=-164,y=96,z=-212,dx=183,dy=48,dz=199,tag=Boss] AreaMusic 113
#
#Command Block Areas
#
scoreboard players set @a[x=-79,y=52,z=17,dx=35,dy=22,dz=58] AreaMusic 18
scoreboard players operation @a[x=-29,y=56,z=4,dx=8,dy=7,dz=7] AreaMusic = @e[x=-23.5,y=57.0,z=12.5,tag=MusicTestArea,limit=1,sort=nearest] AreaMusic
#
#Test Areas
#
scoreboard players set @a[x=-32,y=52,z=16,dx=63,dy=22,dz=63] AreaMusic 6
scoreboard players set @a[x=32,y=53,z=-80,dx=63,dy=10,dz=63] AreaMusic 3

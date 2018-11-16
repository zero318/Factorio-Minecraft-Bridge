execute store result score Time DerpcraftData run time query daytime
execute store result score Moon DerpcraftData run time query day
scoreboard players operation Moon DerpcraftData %= MoonMod DerpcraftData
execute as @a store result score @s FallDistance run data get entity @s FallDistance 100
execute as @a store result score @s Dimension run data get entity @s Dimension 1
execute as @a store result score @s YPos run data get entity @s Pos[1] 10
scoreboard players add @a AdvancementTimer 1
#
execute as @a[scores={AdvancementTimer=20..}] run function derpcraft:music/core/sub_natural/sub_detect_advancements
tag @a[tag=OpenSky] remove OpenSky
#
execute as @a at @s run function derpcraft:music/core/sub_natural/sub_last_block
#
tag @a[tag=InCave] remove InCave
tag @a[tag=!OpenSky,scores={LastAir=1}] add InCave
tag @a[tag=OpenSky,tag=WaterMusic] remove WaterMusic
tag @a[tag=InCave,tag=WaterMusic] remove WaterMusic
execute as @a[tag=OpenSky,scores={InFluid=0}] at @s run tag @s[y=0,dy=57] add WaterMusic
#
scoreboard players set @a[tag=!InCave] CaveMusic 0
execute as @a[tag=!InCave,tag=!WaterMusic] run function derpcraft:music/play/natural_music/default
execute if score Time DerpcraftData matches 13000..22500 run function derpcraft:music/core/sub_natural/sub_moon
execute as @a[tag=InCave,tag=!WaterMusic] run function derpcraft:music/play/natural_music/underground
execute as @a[tag=!InCave,tag=WaterMusic] run function derpcraft:music/play/natural_music/underwater
function derpcraft:music/play/natural_music/feature
function derpcraft:music/play/natural_music/other
#
scoreboard players set @a[scores={AdvancementTimer=20..,Biome=0..}] AdvancementTimer 0
advancement revoke @a only derpcraft:music/natural_music/selectors
scoreboard players set @a[scores={FallDistance=1..}] IsJumping 0
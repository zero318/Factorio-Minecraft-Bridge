#
#Other Sounds
#
#Overworld Lava Layer
#Norfair
execute as @a[tag=!WaterMusic,scores={Dimension=0}] at @s run scoreboard players set @s[y=0,dy=10] AreaMusic 23
#
#Under World except in End
#Silent
execute as @a[scores={Dimension=-1..0}] if score @s YPos matches ..-1 run scoreboard players set @s AreaMusic 0
#
#Mushroom Island Override
#Rainbow Bunchie
scoreboard players set @a[scores={Biome=14..15}] AreaMusic 108
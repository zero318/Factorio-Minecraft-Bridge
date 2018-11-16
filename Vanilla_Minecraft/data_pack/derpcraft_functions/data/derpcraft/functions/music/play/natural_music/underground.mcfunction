#Plains/Plains M
#Cabbage Cavern
scoreboard players set @s[scores={Biome=1}] CaveMusic 52
scoreboard players set @s[scores={Biome=129}] CaveMusic 52
#
#Desert/Desert Hills/Desert M
#Meltdown
scoreboard players set @s[scores={Biome=2}] CaveMusic 59
scoreboard players set @s[scores={Biome=17}] CaveMusic 59
scoreboard players set @s[scores={Biome=130}] CaveMusic 59
#
#Swampland
#Red Brinstar
scoreboard players set @s[scores={Biome=6}] CaveMusic 19
#
#Mesa/Mesa Rock/Mesa Clear Rock/Mesa M/Mesa Rock M/Mesa Clear Rock M
#Lava Powerhouse
scoreboard players set @s[scores={Biome=37..39}] CaveMusic 74
scoreboard players set @s[scores={Biome=165..167}] CaveMusic 74
#
#Extreme Hills/Extreme Hills Edge/Extreme Hills+/Extreme Hills M/Extreme Hills+ M
#Mystic Cave 2 Player
scoreboard players set @s[scores={Biome=3}] CaveMusic 30
scoreboard players set @s[scores={Biome=20}] CaveMusic 30
scoreboard players set @s[scores={Biome=34}] CaveMusic 30
scoreboard players set @s[scores={Biome=131}] CaveMusic 30
scoreboard players set @s[scores={Biome=162}] CaveMusic 30
#
#Jungle/Jungle Hills/Jungle Edge/JungleM/Jungle EdgeM
#Green Brinstar
scoreboard players set @s[scores={Biome=21..23}] CaveMusic 15
scoreboard players set @s[scores={Biome=149..151}] CaveMusic 15
#
#Roofed Forest/Roofed Forest M/Extreme
#Oil Ocean
scoreboard players set @s[scores={Biome=29}] CaveMusic 31
scoreboard players set @s[scores={Biome=157}] CaveMusic 31
#
#Nether
#Lower Norfair
scoreboard players set @s[scores={Biome=8}] CaveMusic 29
#
execute unless entity @s[tag=Reload] run scoreboard players operation @s AreaMusic = @s CaveMusic
execute if score @s CaveMusic matches 0 run function derpcraft:music/play/natural_music/default
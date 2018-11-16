#scoreboard objectives add ReloadTemp dummy
#execute store success score ObjectiveCount ReloadTemp run scoreboard objectives add MusicData dummy
#execute if score ObjectiveCount ReloadTemp matches 1 run function derpcraft:music/core/initialize
#scoreboard objectives remove ReloadTemp
#
tag @a add Reload
tag @a[tag=HasIntro] add ReloadIntro
scoreboard players set @a AreaMusic 0
function derpcraft:music/core/sub_natural/reload
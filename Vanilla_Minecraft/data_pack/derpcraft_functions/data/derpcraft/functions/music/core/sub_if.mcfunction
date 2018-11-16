scoreboard players remove @s[scores={MusicTimer=1..}] MusicTimer 1
scoreboard players add @s[scores={MusicTimer=..-1}] MusicTimer 1
#
execute if score @s MusicTimer matches 0 at @s run function derpcraft:music/loops
#
execute if entity @s[tag=ReloadIntro] run function derpcraft:music/core/sub_reload_offset
execute if score @s JoinedMapReset matches 1.. run function derpcraft:music/core/sub_rejoin_offset
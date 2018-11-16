#========================================
#Music Function
#Version: 14
#========================================
#
execute as @a[tag=!NewPlayer] run function derpcraft:music/core/sub_new_player
#
#Areas
#
scoreboard players set @a AreaMusic 0
#
execute if score NaturalMusic DerpcraftData matches 1 run function derpcraft:music/core/sub_natural/main
execute if score AdventureMap DerpcraftData matches 1 run function derpcraft:music/play/adventure_map/areas
#
#Override System
#
execute as @a[scores={MO=0..}] run function derpcraft:music/core/sub_override
#
#Death Handler
#
execute as @a[scores={YouAreDead=1..}] at @s run function derpcraft:music/core/sub_dead
#
execute as @a unless score @s Music = @s AreaMusic at @s run function derpcraft:music/core/sub_switch
#execute as @a at @s run function derpcraft:music/core/sub_if
#
scoreboard players remove @a[scores={MusicTimer=1..}] MusicTimer 1
scoreboard players add @a[scores={MusicTimer=..-1}] MusicTimer 1
#
execute as @a[scores={MusicTimer=0}] at @s run function derpcraft:music/loops
#
execute as @a[tag=Reload] run function derpcraft:music/core/sub_reload_offset
execute as @a[scores={JoinedMapReset=1..}] run function derpcraft:music/core/sub_rejoin_offset
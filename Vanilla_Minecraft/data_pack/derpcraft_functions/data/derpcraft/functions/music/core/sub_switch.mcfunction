tag @s remove HasIntro
stopsound @s record
scoreboard players operation @s Music = @s AreaMusic
scoreboard players set @s MusicTimer 0
#
function derpcraft:music/intros
tag @s[scores={MusicTimer=..-1}] add HasIntro
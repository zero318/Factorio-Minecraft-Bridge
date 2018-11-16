scoreboard players set @s Music 0
scoreboard players set @s AreaMusic 0
scoreboard players set @s MusicTimer 0
scoreboard players remove @s[scores={MusicTimer=..-2}] MusicTimer 35
scoreboard players add @s[scores={MusicTimer=1..}] MusicTimer 35
scoreboard players set @s Biome -1
scoreboard players set @s JoinedMapReset 0
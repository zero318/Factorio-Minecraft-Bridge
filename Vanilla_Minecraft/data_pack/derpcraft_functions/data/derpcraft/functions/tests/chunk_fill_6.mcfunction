scoreboard objectives add Temp dummy
#kill @e[tag=ChunkFill]
tp @p 912 56 -1008
#summon minecraft:armor_stand 912 56 -1008 {Small:1,NoGravity:1,Invulnerable:1,Tags:["ChunkFill","Done","ChunkTP"]}
scoreboard players set Chunk Temp 0
scoreboard players set Chunk2 Temp 0
scoreboard players set Chunk3 Temp 0
scoreboard players set ChunkTotal Temp 9025
scoreboard players set ChunkDivider Temp 16
scoreboard players set ChunkDivider2 Temp 95
scoreboard players set ChunkType Temp 0
scoreboard players set CenterChunkX Temp 160
scoreboard players set CenterChunkZ Temp -256
tag @e[tag=ChunkFill,tag=Done] remove Done
tag @p add ChunkTP
tag @p add ChunkFill
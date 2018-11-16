execute store result score XPos Temp run data get entity @s Pos[0]
execute store result score ZPos Temp run data get entity @s Pos[2]
scoreboard players operation XPos Temp -= CenterChunkX Temp
scoreboard players operation ZPos Temp -= CenterChunkZ Temp
execute if score XPos Temp matches ..-1 run scoreboard players operation XPos Temp *= -1 -1
execute if score ZPos Temp matches ..-1 run scoreboard players operation ZPos Temp *= -1 -1
scoreboard players operation XPos Temp /= ChunkDivider Temp
scoreboard players operation ZPos Temp /= ChunkDivider Temp
execute if score XPos Temp >= ZPos Temp store result score ChunkRing Temp run scoreboard players get XPos Temp
execute if score ZPos Temp > XPos Temp store result score ChunkRing Temp run scoreboard players get ZPos Temp
scoreboard players add Chunk Temp 1
execute store result score Chunk2 Temp run scoreboard players get Chunk Temp
execute store result score Chunk3 Temp run scoreboard players get Chunk Temp
scoreboard players operation Chunk2 Temp /= ChunkDivider2 Temp
scoreboard players operation Chunk3 Temp %= ChunkDivider2 Temp
tellraw @p [{"text":"\nChunk Column: "},{"score":{"objective":"Temp","name":"Chunk2"}},{"text":" / "},{"score":{"objective":"Temp","name":"ChunkDivider2"}},{"text":"\nChunk Row: "},{"score":{"objective":"Temp","name":"Chunk3"}},{"text":" / "},{"score":{"objective":"Temp","name":"ChunkDivider2"}},{"text":"\nChunk Total: "},{"score":{"objective":"Temp","name":"Chunk"}},{"text":" / "},{"score":{"objective":"Temp","name":"ChunkTotal"}}]
function derpcraft:tests/chunk_fill_3
execute if score ChunkType Temp matches 0 run function derpcraft:tests/chunk_fill_4
execute if score ChunkType Temp matches 1 run function derpcraft:tests/chunk_fill_5
fill ~ 0 ~ ~15 0 ~15 minecraft:barrier
execute store result score ChunkType Temp if score ChunkType Temp matches 0
#
tp @e[tag=ChunkTP] ~ ~ ~16
execute if score ChunkRing Temp matches 48 run tp @e[tag=ChunkTP] ~-16 ~ ~-1520
execute if score ChunkRing Temp matches 48 store result score ChunkType Temp if score ChunkType Temp matches 0
execute if score Chunk Temp = ChunkTotal Temp run tag @s add Done
execute if score Chunk Temp = ChunkTotal Temp run tag @a[tag=ChunkTP] remove ChunkTp
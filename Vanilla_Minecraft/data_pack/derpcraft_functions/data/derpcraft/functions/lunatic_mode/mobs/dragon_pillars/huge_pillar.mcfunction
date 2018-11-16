fill ~5 ~4 ~5 ~-5 ~-2 ~-5 minecraft:iron_bars
#
execute if score DragonDoors DerpcraftData matches 1 run fill ~5 ~5 ~5 ~-5 ~5 ~-5 minecraft:iron_trapdoor[half=bottom]
execute if score DragonDoors DerpcraftData matches 1 run fill ~5 ~-3 ~5 ~-5 ~-2 ~-5 minecraft:iron_trapdoor[half=top]
#
fill ~4 ~3 ~ ~-4 ~-1 ~ minecraft:air
fill ~ ~3 ~4 ~ ~-1 ~-4 minecraft:air
fill ~3 ~3 ~2 ~-3 ~-1 ~-2 minecraft:air
fill ~2 ~3 ~3 ~-2 ~-1 ~-3 minecraft:air
#
fill ~5 ~5 ~5 ~3 ~-3 ~5 minecraft:air
fill ~5 ~5 ~5 ~5 ~-3 ~3 minecraft:air
#
fill ~-5 ~5 ~5 ~-3 ~-3 ~5 minecraft:air
fill ~-5 ~5 ~5 ~-5 ~-3 ~3 minecraft:air
#
fill ~5 ~5 ~-5 ~3 ~-3 ~-5 minecraft:air
fill ~5 ~5 ~-5 ~5 ~-3 ~-3 minecraft:air
#
fill ~-5 ~5 ~-5 ~-3 ~-3 ~-5 minecraft:air
fill ~-5 ~5 ~-5 ~-5 ~-3 ~-3 minecraft:air
#
setblock ~ ~-1 ~ minecraft:bedrock
setblock ~ ~ ~ minecraft:fire
fill ~5 ~-2 ~1 ~-5 ~-3 ~-1 minecraft:obsidian
fill ~1 ~-2 ~5 ~-1 ~-3 ~-5 minecraft:obsidian
fill ~4 ~-2 ~3 ~-4 ~-3 ~-3 minecraft:obsidian
fill ~3 ~-2 ~4 ~-3 ~-3 ~-4 minecraft:obsidian
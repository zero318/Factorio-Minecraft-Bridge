fill ~3 ~2 ~3 ~-3 ~-2 ~-3 minecraft:iron_bars
#
execute if score DragonDoors DerpcraftData matches 1 run fill ~3 ~3 ~3 ~-3 ~3 ~-3 minecraft:iron_trapdoor[half=bottom]
execute if score DragonDoors DerpcraftData matches 1 run fill ~3 ~-3 ~3 ~-3 ~-2 ~-3 minecraft:iron_trapdoor[half=top]
#
fill ~3 ~3 ~3 ~3 ~-3 ~3 minecraft:air
#
fill ~-3 ~3 ~3 ~-3 ~-3 ~3 minecraft:air
#
fill ~3 ~3 ~-3 ~3 ~-3 ~-3 minecraft:air
#
fill ~-3 ~3 ~-3 ~-3 ~-3 ~-3 minecraft:air
#
fill ~2 ~1 ~ ~-2 ~-1 ~ minecraft:air
fill ~ ~1 ~2 ~ ~-1 ~-2 minecraft:air
fill ~1 ~1 ~1 ~-1 ~-1 ~-1 minecraft:air
#
setblock ~ ~-1 ~ minecraft:bedrock
setblock ~ ~ ~ minecraft:fire
fill ~3 ~-2 ~1 ~-3 ~-3 ~-1 minecraft:obsidian
fill ~1 ~-2 ~3 ~-1 ~-3 ~-3 minecraft:obsidian
fill ~2 ~-2 ~2 ~-2 ~-3 ~-2 minecraft:obsidian
fill ~2 ~2 ~2 ~-2 ~-2 ~-2 minecraft:iron_bars outline
#
execute if score DragonDoors DerpcraftData matches 1 run fill ~2 ~3 ~2 ~-2 ~3 ~-2 minecraft:iron_trapdoor[half=bottom]
execute if score DragonDoors DerpcraftData matches 1 run fill ~2 ~-3 ~2 ~-2 ~-2 ~-2 minecraft:iron_trapdoor[half=top]
#
fill ~1 ~1 ~1 ~1 ~-1 ~1 minecraft:iron_bars
fill ~1 ~1 ~-1 ~1 ~-1 ~-1 minecraft:iron_bars
fill ~-1 ~1 ~1 ~-1 ~-1 ~1 minecraft:iron_bars
fill ~-1 ~1 ~-1 ~-1 ~-1 ~-1 minecraft:iron_bars
#
fill ~2 ~-2 ~1 ~-2 ~-3 ~-1 minecraft:obsidian
fill ~1 ~-2 ~2 ~-1 ~-3 ~-2 minecraft:obsidian
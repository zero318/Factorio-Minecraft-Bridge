execute if block ~ ~ ~ minecraft:chest[type=left] positioned ~ ~ ~1 run function fmcbridge:force_single_chest/north/side_chest
execute if block ~ ~ ~ minecraft:chest[type=right] positioned ~ ~ ~-1 run function fmcbridge:force_single_chest/north/side_chest
function fmcbridge:force_single_chest/north/place_chest
execute if block ~ ~ ~ minecraft:chest[type=left] positioned ~ ~ ~-1 run function fmcbridge:force_single_chest/west/side_chest
execute if block ~ ~ ~ minecraft:chest[type=right] positioned ~ ~ ~1 run function fmcbridge:force_single_chest/west/side_chest
function fmcbridge:force_single_chest/west/place_chest
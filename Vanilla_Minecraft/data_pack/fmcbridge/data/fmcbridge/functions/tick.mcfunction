execute as @e[tag=TransferChest,tag=!ChestInitialized] at @s run function fmcbridge:initialize_chest
execute as @e[tag=TransferChest] at @s unless block ~ ~ ~ minecraft:chest run kill @s
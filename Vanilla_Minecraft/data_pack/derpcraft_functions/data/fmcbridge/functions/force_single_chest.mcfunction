data modify entity @s ArmorItems[3].tag.TransferChestTemp.Items set from block ~ ~ ~ Items
data modify entity @s ArmorItems[3].tag.TransferChestTemp.CustomName set from block ~ ~ ~ CustomName
data modify entity @s ArmorItems[3].tag.TransferChestTemp.Lock set from block ~ ~ ~ Lock
execute if block ~ ~ ~ minecraft:chest[facing=north] run function fmcbridge:force_single_chest/north/check_side
execute if block ~ ~ ~ minecraft:chest[facing=east] run function fmcbridge:force_single_chest/east/check_side
execute if block ~ ~ ~ minecraft:chest[facing=west] run function fmcbridge:force_single_chest/west/check_side
execute if block ~ ~ ~ minecraft:chest[facing=south] run function fmcbridge:force_single_chest/south/check_side
data modify block ~ ~ ~ Items set from entity @s ArmorItems[3].tag.TransferChestTemp.Items
data modify block ~ ~ ~ CustomName set from entity @s ArmorItems[3].tag.TransferChestTemp.CustomName
data modify block ~ ~ ~ Lock set from entity @s ArmorItems[3].tag.TransferChestTemp.Lock
execute if block ~ ~ ~ minecraft:air run function fmcbridge:initialize/not_waterlogged
execute if block ~ ~ ~ minecraft:water run function fmcbridge:initialize/waterlogged
data modify block ~ ~ ~ CustomName set from entity @s ArmorItems[3].tag.TransferChestTemp.CustomName
data remove entity @s Pose
tag @s add NeedsRotation
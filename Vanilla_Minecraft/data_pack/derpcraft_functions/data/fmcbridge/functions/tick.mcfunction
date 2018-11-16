execute as @e[tag=TransferChest,tag=!ChestInitialized] at @s run function fmcbridge:initialize/type
execute as @e[tag=TransferChest] at @s unless block ~ ~ ~ minecraft:chest run kill @s
execute as @e[tag=TransferChest] at @s unless block ~ ~ ~ minecraft:chest[type=single] run function fmcbridge:force_single_chest

execute as @e[tag=SendChest] unless entity @s[nbt={ArmorItems:[{tag:{ClearItems:0}}]}] at @s run function fmcbridge:clear_items

execute as @e[tag=ReceiveChest,tag=!ReceiveFull] at @s run function fmcbridge:check_if_full
execute as @e[tag=ReceiveChest,tag=ReceiveFull] at @s run function fmcbridge:check_if_still_full
execute as @e[tag=ReceiveChest,tag=!ReceiveFull] unless entity @s[nbt={ArmorItems:[{tag:{CollectItems:0}}]}] at @s run function fmcbridge:collect_items

#execute as @e[tag=ReceiveChest,tag=!ReceiveFull] run say Not Full
#execute as @e[tag=ReceiveChest,tag=ReceiveFull] run say Full
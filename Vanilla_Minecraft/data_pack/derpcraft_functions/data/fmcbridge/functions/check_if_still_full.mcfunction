execute store result entity @s ArmorItems[3].tag.FilledSlots int 1 run data get block ~ ~ ~ Items
execute unless entity @s[nbt={ArmorItems:[{tag:{FilledSlots:27}}]}] run tag @s remove ReceiveFull
#data remove block ~ ~ ~ Items 
loot insert ~ ~ ~ mine ~ 0 ~ minecraft:air{drop_contents:true}
setblock ~ 0 ~ minecraft:bedrock
execute store result entity @s ArmorItems[3].tag.FilledSlots int 1 run data get block ~ ~ ~ Items
execute if entity @s[nbt={ArmorItems:[{tag:{FilledSlots:27}}]}] run tag @s add ReceiveFull
data modify entity @s ArmorItems[3].tag.CollectItems set value 0
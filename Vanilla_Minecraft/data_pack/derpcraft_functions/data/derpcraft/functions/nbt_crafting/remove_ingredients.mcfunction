#replaceitem entity @s enderchest.5 minecraft:air
#replaceitem entity @s enderchest.6 minecraft:air
#replaceitem entity @s enderchest.7 minecraft:air
#replaceitem entity @s enderchest.14 minecraft:air
#replaceitem entity @s enderchest.15 minecraft:air
#replaceitem entity @s enderchest.16 minecraft:air
#replaceitem entity @s enderchest.23 minecraft:air
#replaceitem entity @s enderchest.24 minecraft:air
#replaceitem entity @s enderchest.25 minecraft:air

execute in minecraft:overworld run setblock 0 0 0 minecraft:shulker_box
execute in minecraft:overworld run data modify block 0 0 0 Items set from entity @s EnderItems
execute in minecraft:overworld positioned 0 0 0 if data block ~ ~ ~ Items[{Slot:5b}] store result score @s NBT_Craft run data get block ~ ~ ~ Items[{Slot:5b}].Count
execute in minecraft:overworld positioned 0 0 0 if data block ~ ~ ~ Items[{Slot:5b}] store result block ~ ~ ~ Items[{Slot:5b}].Count byte 1 run scoreboard players remove @s NBT_Craft 1
execute in minecraft:overworld positioned 0 0 0 if data block ~ ~ ~ Items[{Slot:6b}] store result score @s NBT_Craft run data get block ~ ~ ~ Items[{Slot:6b}].Count
execute in minecraft:overworld positioned 0 0 0 if data block ~ ~ ~ Items[{Slot:6b}] store result block ~ ~ ~ Items[{Slot:6b}].Count byte 1 run scoreboard players remove @s NBT_Craft 1
execute in minecraft:overworld positioned 0 0 0 if data block ~ ~ ~ Items[{Slot:7b}] store result score @s NBT_Craft run data get block ~ ~ ~ Items[{Slot:7b}].Count
execute in minecraft:overworld positioned 0 0 0 if data block ~ ~ ~ Items[{Slot:7b}] store result block ~ ~ ~ Items[{Slot:7b}].Count byte 1 run scoreboard players remove @s NBT_Craft 1
execute in minecraft:overworld positioned 0 0 0 if data block ~ ~ ~ Items[{Slot:14b}] store result score @s NBT_Craft run data get block ~ ~ ~ Items[{Slot:14b}].Count
execute in minecraft:overworld positioned 0 0 0 if data block ~ ~ ~ Items[{Slot:14b}] store result block ~ ~ ~ Items[{Slot:14b}].Count byte 1 run scoreboard players remove @s NBT_Craft 1
execute in minecraft:overworld positioned 0 0 0 if data block ~ ~ ~ Items[{Slot:15b}] store result score @s NBT_Craft run data get block ~ ~ ~ Items[{Slot:15b}].Count
execute in minecraft:overworld positioned 0 0 0 if data block ~ ~ ~ Items[{Slot:15b}] store result block ~ ~ ~ Items[{Slot:15b}].Count byte 1 run scoreboard players remove @s NBT_Craft 1
execute in minecraft:overworld positioned 0 0 0 if data block ~ ~ ~ Items[{Slot:16b}] store result score @s NBT_Craft run data get block ~ ~ ~ Items[{Slot:16b}].Count
execute in minecraft:overworld positioned 0 0 0 if data block ~ ~ ~ Items[{Slot:16b}] store result block ~ ~ ~ Items[{Slot:16b}].Count byte 1 run scoreboard players remove @s NBT_Craft 1
execute in minecraft:overworld positioned 0 0 0 if data block ~ ~ ~ Items[{Slot:23b}] store result score @s NBT_Craft run data get block ~ ~ ~ Items[{Slot:23b}].Count
execute in minecraft:overworld positioned 0 0 0 if data block ~ ~ ~ Items[{Slot:23b}] store result block ~ ~ ~ Items[{Slot:23b}].Count byte 1 run scoreboard players remove @s NBT_Craft 1
execute in minecraft:overworld positioned 0 0 0 if data block ~ ~ ~ Items[{Slot:24b}] store result score @s NBT_Craft run data get block ~ ~ ~ Items[{Slot:24b}].Count
execute in minecraft:overworld positioned 0 0 0 if data block ~ ~ ~ Items[{Slot:24b}] store result block ~ ~ ~ Items[{Slot:24b}].Count byte 1 run scoreboard players remove @s NBT_Craft 1
execute in minecraft:overworld positioned 0 0 0 if data block ~ ~ ~ Items[{Slot:25b}] store result score @s NBT_Craft run data get block ~ ~ ~ Items[{Slot:25b}].Count
execute in minecraft:overworld positioned 0 0 0 if data block ~ ~ ~ Items[{Slot:25b}] store result block ~ ~ ~ Items[{Slot:25b}].Count byte 1 run scoreboard players remove @s NBT_Craft 1
execute in minecraft:overworld run loot replace entity @s enderchest.0 mine 0 0 0 minecraft:air{drop_contents:true}
execute in minecraft:overworld run setblock 0 0 0 minecraft:bedrock
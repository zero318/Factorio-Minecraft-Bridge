execute unless data entity @s EnderItems[{Slot:8b}] run replaceitem entity @s enderchest.8 minecraft:ink_sac{NBT_Craft_GUI:1b,CustomModelData:1}
execute unless data entity @s EnderItems[{Slot:17b}] run replaceitem entity @s enderchest.17 minecraft:ink_sac{NBT_Craft_GUI:1b,CustomModelData:2}
execute unless data entity @s EnderItems[{Slot:26b}] run replaceitem entity @s enderchest.26 minecraft:ink_sac{NBT_Craft_GUI:1b,CustomModelData:3}
#
execute store result score @s EnderGUICount if data entity @s EnderItems[{id:"minecraft:ink_sac",tag:{CustomModelData:1}}]
execute if score @s EnderGUICount matches 2.. run function derpcraft:nbt_crafting/remove/ender_gui
execute store result score @s EnderGUICount if data entity @s EnderItems[{id:"minecraft:ink_sac",tag:{CustomModelData:2}}]
execute if score @s EnderGUICount matches 2.. run function derpcraft:nbt_crafting/remove/output_placeholder
execute store result score @s EnderGUICount if data entity @s EnderItems[{id:"minecraft:ink_sac",tag:{CustomModelData:3}}]
execute if score @s EnderGUICount matches 2.. run function derpcraft:nbt_crafting/remove/ender_gui_empty
execute if data entity @s Inventory[{id:"minecraft:ink_sac",tag:{NBT_Craft_GUI:1b}}] run clear @s minecraft:ink_sac{NBT_Craft_GUI:1b}
#
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:ink_sac",tag:{NBT_Craft_GUI:1b}}}]
tag @a[tag=!ender_crafting] add ender_crafting
#
execute as @a[tag=ender_crafting] run function derpcraft:nbt_crafting/recipes
#execute as @a[tag=ender_crafting] if data entity @s EnderItems[{Slot:8b,Count:1b,id:"minecraft:ink_sac",tag:{NBT_Craft_GUI:1,CustomModelData:1}}] run function derpcraft:nbt_crafting/recipes
#
execute as @a[tag=ender_crafting] run function derpcraft:nbt_crafting/fill_gui
execute unless data entity @s EnderItems[{Slot:5b}] unless data entity @s EnderItems[{Slot:6b}] unless data entity @s EnderItems[{Slot:7b}] unless data entity @s EnderItems[{Slot:14b}] if data entity @s EnderItems[{Slot:15b,id:"minecraft:iron_nugget"}] unless data entity @s EnderItems[{Slot:16b}] unless data entity @s EnderItems[{Slot:23b}] if data entity @s EnderItems[{Slot:24b,id:"minecraft:iron_nugget"}] unless data entity @s EnderItems[{Slot:25b}] run tag @s add IronStick_Still
replaceitem entity @s[tag=IronStick,tag=!IronStick_Still] enderchest.17 minecraft:ink_sac{NBT_Craft_GUI:1b,CustomModelData:2}
tag @s[tag=IronStick,tag=!IronStick_Still] remove IronStick
tag @s[tag=IronStick_Still] remove IronStick_Still
execute unless data entity @s[tag=IronStick] EnderItems[{Slot:17b,Count:1b,id:"minecraft:ink_sac",tag:{CustomModelData:1453}}] run function derpcraft:nbt_crafting/remove_ingredients
execute unless data entity @s[tag=IronStick] EnderItems[{Slot:17b,Count:1b,id:"minecraft:ink_sac",tag:{CustomModelData:1453}}] unless data entity @s EnderItems[{Slot:17b,id:"minecraft:ink_sac",tag:{CustomModelData:2}}] run tag @s remove IronStick
execute if data entity @s[tag=IronStick] EnderItems[{Slot:17b,id:"minecraft:ink_sac",tag:{CustomModelData:2}}] run tag @s remove IronStick
execute if data entity @s EnderItems[{Slot:17b,id:"minecraft:ink_sac",tag:{CustomModelData:2}}] unless data entity @s EnderItems[{Slot:5b}] unless data entity @s EnderItems[{Slot:6b}] unless data entity @s EnderItems[{Slot:7b}] unless data entity @s EnderItems[{Slot:14b}] if data entity @s EnderItems[{Slot:15b,id:"minecraft:iron_nugget"}] unless data entity @s EnderItems[{Slot:16b}] unless data entity @s EnderItems[{Slot:23b}] if data entity @s EnderItems[{Slot:24b,id:"minecraft:iron_nugget"}] unless data entity @s EnderItems[{Slot:25b}] run tag @s add IronStick
replaceitem entity @s[tag=IronStick] enderchest.17 minecraft:ink_sac{CustomModelData:1453} 1
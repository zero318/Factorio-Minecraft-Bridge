execute unless entity @e[tag=PlayerRelative] run summon minecraft:armor_stand ~ ~ ~ {Invulnerable:1,Marker:1,NoGravity:1,NoBasePlate:1,Invisible:1,Silent:1,Small:1,Tags:["PlayerRelative"]}
#execute as @a[gamemode=!creative,scores={CarrotOnAStick=2,FlamethrowerAmmo=250..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:"{\"text\":\"Flamethrower\",\"color\":\"dark_red\",\"italic\":false}",Lore:["Uses Flamethrower Ammo"]},Unbreakable:1,HideFlags:4,Damage:26}},Inventory:[{Slot:-106b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:"{\"text\":\"Flamethrower\",\"color\":\"dark_red\",\"italic\":false}",Lore:["Uses Flamethrower Ammo"]},Unbreakable:1,HideFlags:4,Damage:26}}]}] at @s run function derpcraft:items/flamethrower/sub_fireball
execute as @a[gamemode=!creative,scores={CarrotOnAStick=1,FlamethrowerAmmo=1..},nbt={Inventory:[{Slot:-106b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:"{\"text\":\"Flamethrower\",\"color\":\"dark_red\",\"italic\":false}",Lore:["Uses Flamethrower Ammo"]},Unbreakable:1,HideFlags:4,Damage:26}}]}] at @s run function derpcraft:items/flamethrower/sub_small_fireball
execute as @a[gamemode=!creative,scores={CarrotOnAStick=1,FlamethrowerAmmo=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:"{\"text\":\"Flamethrower\",\"color\":\"dark_red\",\"italic\":false}",Lore:["Uses Flamethrower Ammo"]},Unbreakable:1,HideFlags:4,Damage:26}}}] at @s run function derpcraft:items/flamethrower/sub_small_fireball
#execute as @a[gamemode=creative,scores={CarrotOnAStick=2},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:"{\"text\":\"Flamethrower\",\"color\":\"dark_red\",\"italic\":false}",Lore:["Uses Flamethrower Ammo"]},Unbreakable:1,HideFlags:4,Damage:26}},Inventory:[{Slot:-106b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:"{\"text\":\"Flamethrower\",\"color\":\"dark_red\",\"italic\":false}",Lore:["Uses Flamethrower Ammo"]},Unbreakable:1,HideFlags:4,Damage:26}}]}] at @s run function derpcraft:items/flamethrower/sub_fireball
execute as @a[gamemode=creative,scores={CarrotOnAStick=1},nbt={Inventory:[{Slot:-106b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:"{\"text\":\"Flamethrower\",\"color\":\"dark_red\",\"italic\":false}",Lore:["Uses Flamethrower Ammo"]},Unbreakable:1,HideFlags:4,Damage:26}}]}] at @s run function derpcraft:items/flamethrower/sub_small_fireball
execute as @a[gamemode=creative,scores={CarrotOnAStick=1},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:"{\"text\":\"Flamethrower\",\"color\":\"dark_red\",\"italic\":false}",Lore:["Uses Flamethrower Ammo"]},Unbreakable:1,HideFlags:4,Damage:26}}}] at @s run function derpcraft:items/flamethrower/sub_small_fireball
#scoreboard players set @a[scores={CarrotOnAStick=1..}] CarrotOnAStick 0
#
scoreboard players add @e[tag=Flamethrower] DerpcraftData 1
execute if score FT_FireSheet DerpcraftData matches 1 as @e[tag=Flamethrower,scores={DerpcraftData=5..},tag=!FT_Fireball] at @s unless block ~ ~ ~ minecraft:fire run summon minecraft:small_fireball ~ ~ ~ {direction:[0.0,0.0,0.0],power:[0.0,-1.0,0.0],Tags:["FT_Small_Fireball"]}
kill @e[tag=Flamethrower,scores={DerpcraftData=60..}]
#
#clear @a[nbt={Inventory:[{id:"minecraft:debug_stick"}]}] minecraft:debug_stick
#scoreboard players add @a[scores={NBT_Craft=2}] FlamethrowerAmmo 1
#scoreboard players set @a[scores={NBT_Craft=1..}] NBT_Craft 0
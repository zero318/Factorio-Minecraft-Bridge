execute if entity @a[scores={PortalMainR=0..}] as @a[scores={PortalMainR=0..}] run function derpcraft:items/portal_gun/sub_set_color/main_r
execute if entity @a[scores={PortalMainG=0..}] as @a[scores={PortalMainG=0..}] run function derpcraft:items/portal_gun/sub_set_color/main_g
execute if entity @a[scores={PortalMainB=0..}] as @a[scores={PortalMainB=0..}] run function derpcraft:items/portal_gun/sub_set_color/main_b
execute if entity @a[scores={PortalAltR=0..}] as @a[scores={PortalAltR=0..}] run function derpcraft:items/portal_gun/sub_set_color/alt_r
execute if entity @a[scores={PortalAltG=0..}] as @a[scores={PortalAltG=0..}] run function derpcraft:items/portal_gun/sub_set_color/alt_g
execute if entity @a[scores={PortalAltB=0..}] as @a[scores={PortalAltB=0..}] run function derpcraft:items/portal_gun/sub_set_color/alt_b
execute if entity @a[scores={ResetMainPortal=0..}] as @a[scores={ResetMainPortal=0..}] run function derpcraft:items/portal_gun/reset/sub_main_portal
execute if entity @a[scores={ResetAltPortal=0..}] as @a[scores={ResetAltPortal=0..}] run function derpcraft:items/portal_gun/reset/sub_alt_portal
execute if entity @a[scores={ResetBothPortals=0..}] as @a[scores={ResetBothPortals=0..}] run function derpcraft:items/portal_gun/reset/sub_both_portals
execute unless entity @e[tag=PlayerRelative] run summon minecraft:armor_stand ~ ~ ~ {Invulnerable:1,Marker:1,NoGravity:1,NoBasePlate:1,Invisible:1,Silent:1,Small:1,Tags:["PlayerRelative"]}
execute unless entity @e[tag=PortalPlacer] run summon minecraft:armor_stand ~ ~ ~ {Invulnerable:1,Marker:1,NoGravity:1,NoBasePlate:1,Invisible:1,Silent:1,Small:1,Tags:["PortalPlacer"]}
execute as @a[tag=LastShotOrange,scores={CarrotOnAStick=2..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:"{\"text\":\"Portal Gun\",\"color\":\"blue\",\"italic\":false}"},Unbreakable:1,HideFlags:4,Damage:24}},Inventory:[{Slot:-106b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:"{\"text\":\"Portal Gun\",\"color\":\"blue\",\"italic\":false}"},Unbreakable:1,HideFlags:4,Damage:24}}]}] at @s run function derpcraft:items/portal_gun/sub_shoot_blue_portal
execute as @a[tag=LastShotBlue,scores={CarrotOnAStick=2..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:"{\"text\":\"Portal Gun\",\"color\":\"blue\",\"italic\":false}"},Unbreakable:1,HideFlags:4,Damage:24}},Inventory:[{Slot:-106b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:"{\"text\":\"Portal Gun\",\"color\":\"blue\",\"italic\":false}"},Unbreakable:1,HideFlags:4,Damage:24}}]}] at @s run function derpcraft:items/portal_gun/sub_shoot_orange_portal
execute as @a[scores={CarrotOnAStick=1..},nbt={Inventory:[{Slot:-106b,id:"minecraft:carrot_on_a_stick",tag:{display:{Name:"{\"text\":\"Portal Gun\",\"color\":\"blue\",\"italic\":false}"},Unbreakable:1,HideFlags:4,Damage:24}}]}] at @s run function derpcraft:items/portal_gun/sub_shoot_orange_portal
execute as @a[scores={CarrotOnAStick=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:"{\"text\":\"Portal Gun\",\"color\":\"blue\",\"italic\":false}"},Unbreakable:1,HideFlags:4,Damage:24}}}] at @s run function derpcraft:items/portal_gun/sub_shoot_blue_portal
#
execute if entity @e[tag=PortalBullet,tag=BluePortal,nbt={inGround:1b}] as @e[tag=PortalBullet,tag=BluePortal,nbt={inGround:1b}] at @s run function derpcraft:items/portal_gun/sub_place_blue_portal
execute if entity @e[tag=PortalBullet,tag=OrangePortal,nbt={inGround:1b}] as @e[tag=PortalBullet,tag=OrangePortal,nbt={inGround:1b}] at @s run function derpcraft:items/portal_gun/sub_place_orange_portal
#
execute if entity @e[tag=Portal,tag=BluePortal] as @e[tag=Portal,tag=BluePortal] at @s if entity @e[tag=!NoPortal,tag=!OutPortal,distance=..1] run function derpcraft:items/portal_gun/sub_warp_blue_to_orange
execute if entity @e[tag=Portal,tag=OrangePortal] as @e[tag=Portal,tag=OrangePortal] at @s if entity @e[tag=!NoPortal,tag=!OutPortal,distance=..1] run function derpcraft:items/portal_gun/sub_warp_orange_to_blue
execute if entity @e[tag=OutPortal] as @e[tag=OutPortal] at @s unless entity @e[tag=Portal,distance=..1.0] run tag @s remove OutPortal
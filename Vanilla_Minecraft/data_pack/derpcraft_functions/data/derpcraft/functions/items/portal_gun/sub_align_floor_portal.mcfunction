scoreboard players add @s Yaw 225
scoreboard players operation @s Yaw /= 90 DerpcraftData
execute if score @s Yaw matches 4 run scoreboard players set @s Yaw 0
execute if score @s Yaw matches 0 run tag @e[tag=PortalBaseTemp] add North
execute if score @s Yaw matches 1 run tag @e[tag=PortalBaseTemp] add East
execute if score @s Yaw matches 2 run tag @e[tag=PortalBaseTemp] add South
execute if score @s Yaw matches 3 run tag @e[tag=PortalBaseTemp] add West
scoreboard players operation @s Yaw %= 2 DerpcraftData
execute if score @s Yaw matches 0 run function derpcraft:items/portal_gun/sub_align_floor_portal_z_axis
execute if score @s Yaw matches 1 run function derpcraft:items/portal_gun/sub_align_floor_portal_x_axis
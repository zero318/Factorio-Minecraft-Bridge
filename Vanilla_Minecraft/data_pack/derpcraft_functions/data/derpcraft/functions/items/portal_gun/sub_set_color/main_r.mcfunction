execute store result score @s PortalMainRS run scoreboard players get @s PortalMainR
execute store result score @s PortalMainG run scoreboard players get @s PortalMainGS
execute store result score @s PortalMainB run scoreboard players get @s PortalMainBS
execute store result score @s PortalMainColor run scoreboard players operation @s PortalMainR *= 65536 DerpcraftData
scoreboard players operation @s PortalMainG *= 256 DerpcraftData
scoreboard players operation @s PortalMainColor += @s PortalMainG
scoreboard players operation @s PortalMainColor += @s PortalMainB
scoreboard players set @s PortalMainR -1
scoreboard players set @s PortalMainG -1
scoreboard players set @s PortalMainB -1
scoreboard players enable @s PortalMainR
title @s actionbar [{"text":"Main Portal Colors: "},{"score":{"name":"@s","objective":"PortalMainRS"},"color":"dark_red"},{"text":" "},{"score":{"name":"@s","objective":"PortalMainGS"},"color":"dark_green"},{"text":" "},{"score":{"name":"@s","objective":"PortalMainBS"},"color":"dark_blue"}]
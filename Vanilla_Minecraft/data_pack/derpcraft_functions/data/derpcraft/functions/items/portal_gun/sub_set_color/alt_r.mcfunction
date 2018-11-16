execute store result score @s PortalAltRS run scoreboard players get @s PortalAltR
execute store result score @s PortalAltG run scoreboard players get @s PortalAltGS
execute store result score @s PortalAltB run scoreboard players get @s PortalAltBS
execute store result score @s PortalAltColor run scoreboard players operation @s PortalAltR *= 65536 DerpcraftData
scoreboard players operation @s PortalAltG *= 256 DerpcraftData
scoreboard players operation @s PortalAltColor += @s PortalAltG
scoreboard players operation @s PortalAltColor += @s PortalAltB
scoreboard players set @s PortalAltR -1
scoreboard players set @s PortalAltG -1
scoreboard players set @s PortalAltB -1
scoreboard players enable @s PortalAltR
title @s actionbar [{"text":"Alt Portal Colors: "},{"score":{"name":"@s","objective":"PortalAltRS"},"color":"dark_red"},{"text":" "},{"score":{"name":"@s","objective":"PortalAltGS"},"color":"dark_green"},{"text":" "},{"score":{"name":"@s","objective":"PortalAltBS"},"color":"dark_blue"}]
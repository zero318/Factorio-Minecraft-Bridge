execute at @s as @e[tag=Portal] if score @s DerpcraftOwner = @p DerpcraftID run kill @s
scoreboard players set @s ResetBothPortals -1
scoreboard players enable @s ResetBothPortals
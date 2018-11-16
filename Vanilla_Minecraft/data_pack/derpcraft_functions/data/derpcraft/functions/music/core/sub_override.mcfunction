execute unless entity @s[tag=Reload] if score @s MO matches 1.. run scoreboard players operation @s AreaMusic = @s MO
scoreboard players set @s[scores={MO=0}] MO -1
scoreboard players enable @s MO
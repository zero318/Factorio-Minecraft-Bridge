scoreboard objectives add invcraft_count dummy
scoreboard objectives add invcraft_glass dummy
scoreboard objectives add invcraft_slot dummy

say remove

execute store result score @s invcraft_count run data get block ~ ~ ~ Items[21].Count 1
execute store result score @s invcraft_glass run data get block ~ ~ ~ Items[21].tag.from_chest 1
execute if entity @s[scores={invcraft_count=1..,invcraft_glass=0}] store result block ~ ~ ~ Items[21].Count byte 1 run scoreboard players remove @s invcraft_count 1
execute store result score @s invcraft_count run data get block ~ ~ ~ Items[20].Count 1
execute store result score @s invcraft_glass run data get block ~ ~ ~ Items[20].tag.from_chest 1
execute if entity @s[scores={invcraft_count=1..,invcraft_glass=0}] store result block ~ ~ ~ Items[20].Count byte 1 run scoreboard players remove @s invcraft_count 1
execute store result score @s invcraft_count run data get block ~ ~ ~ Items[19].Count 1
execute store result score @s invcraft_glass run data get block ~ ~ ~ Items[19].tag.from_chest 1
execute if entity @s[scores={invcraft_count=1..,invcraft_glass=0}] store result block ~ ~ ~ Items[19].Count byte 1 run scoreboard players remove @s invcraft_count 1
execute store result score @s invcraft_count run data get block ~ ~ ~ Items[18].Count 1
execute store result score @s invcraft_glass run data get block ~ ~ ~ Items[18].tag.from_chest 1
execute if entity @s[scores={invcraft_count=1..,invcraft_glass=0}] store result block ~ ~ ~ Items[18].Count byte 1 run scoreboard players remove @s invcraft_count 1
execute store result score @s invcraft_count run data get block ~ ~ ~ Items[17].Count 1
execute store result score @s invcraft_glass run data get block ~ ~ ~ Items[17].tag.from_chest 1
execute if entity @s[scores={invcraft_count=1..,invcraft_glass=0}] store result block ~ ~ ~ Items[17].Count byte 1 run scoreboard players remove @s invcraft_count 1
execute store result score @s invcraft_count run data get block ~ ~ ~ Items[16].Count 1
execute store result score @s invcraft_glass run data get block ~ ~ ~ Items[16].tag.from_chest 1
execute if entity @s[scores={invcraft_count=1..,invcraft_glass=0}] store result block ~ ~ ~ Items[16].Count byte 1 run scoreboard players remove @s invcraft_count 1

execute store result score @s invcraft_count run data get block ~ ~ ~ Items[15].Count 1
execute store result score @s invcraft_glass run data get block ~ ~ ~ Items[15].tag.from_chest 1
execute store result score @s invcraft_slot run data get block ~ ~ ~ Items[15].Slot 1
execute if entity @s[scores={invcraft_count=1..,invcraft_glass=0}] unless score @s invcraft_slot matches 15 store result block ~ ~ ~ Items[15].Count byte 1 run scoreboard players remove @s invcraft_count 1
execute store result score @s invcraft_count run data get block ~ ~ ~ Items[14].Count 1
execute store result score @s invcraft_glass run data get block ~ ~ ~ Items[14].tag.from_chest 1
execute store result score @s invcraft_slot run data get block ~ ~ ~ Items[14].Slot 1
execute if entity @s[scores={invcraft_count=1..,invcraft_glass=0}] unless score @s invcraft_slot matches 15 store result block ~ ~ ~ Items[14].Count byte 1 run scoreboard players remove @s invcraft_count 1
execute store result score @s invcraft_count run data get block ~ ~ ~ Items[13].Count 1
execute store result score @s invcraft_glass run data get block ~ ~ ~ Items[13].tag.from_chest 1
execute store result score @s invcraft_slot run data get block ~ ~ ~ Items[13].Slot 1
execute if entity @s[scores={invcraft_count=1..,invcraft_glass=0}] unless score @s invcraft_slot matches 15 store result block ~ ~ ~ Items[13].Count byte 1 run scoreboard players remove @s invcraft_count 1
execute store result score @s invcraft_count run data get block ~ ~ ~ Items[12].Count 1
execute store result score @s invcraft_glass run data get block ~ ~ ~ Items[12].tag.from_chest 1
execute store result score @s invcraft_slot run data get block ~ ~ ~ Items[12].Slot 1
execute if entity @s[scores={invcraft_count=1..,invcraft_glass=0}] unless score @s invcraft_slot matches 15 store result block ~ ~ ~ Items[12].Count byte 1 run scoreboard players remove @s invcraft_count 1
execute store result score @s invcraft_count run data get block ~ ~ ~ Items[11].Count 1
execute store result score @s invcraft_glass run data get block ~ ~ ~ Items[11].tag.from_chest 1
execute store result score @s invcraft_slot run data get block ~ ~ ~ Items[11].Slot 1
execute if entity @s[scores={invcraft_count=1..,invcraft_glass=0}] unless score @s invcraft_slot matches 15 store result block ~ ~ ~ Items[11].Count byte 1 run scoreboard players remove @s invcraft_count 1
execute store result score @s invcraft_count run data get block ~ ~ ~ Items[10].Count 1
execute store result score @s invcraft_glass run data get block ~ ~ ~ Items[10].tag.from_chest 1
execute store result score @s invcraft_slot run data get block ~ ~ ~ Items[10].Slot 1
execute if entity @s[scores={invcraft_count=1..,invcraft_glass=0}] unless score @s invcraft_slot matches 15 store result block ~ ~ ~ Items[10].Count byte 1 run scoreboard players remove @s invcraft_count 1
execute store result score @s invcraft_count run data get block ~ ~ ~ Items[9].Count 1
execute store result score @s invcraft_glass run data get block ~ ~ ~ Items[9].tag.from_chest 1
execute store result score @s invcraft_slot run data get block ~ ~ ~ Items[9].Slot 1
execute if entity @s[scores={invcraft_count=1..,invcraft_glass=0}] unless score @s invcraft_slot matches 15 store result block ~ ~ ~ Items[9].Count byte 1 run scoreboard players remove @s invcraft_count 1

execute store result score @s invcraft_count run data get block ~ ~ ~ Items[8].Count 1
execute store result score @s invcraft_glass run data get block ~ ~ ~ Items[8].tag.from_chest 1
execute if entity @s[scores={invcraft_count=1..,invcraft_glass=0}] store result block ~ ~ ~ Items[8].Count byte 1 run scoreboard players remove @s invcraft_count 1
execute store result score @s invcraft_count run data get block ~ ~ ~ Items[7].Count 1
execute store result score @s invcraft_glass run data get block ~ ~ ~ Items[7].tag.from_chest 1
execute if entity @s[scores={invcraft_count=1..,invcraft_glass=0}] store result block ~ ~ ~ Items[7].Count byte 1 run scoreboard players remove @s invcraft_count 1

execute store result score @s invcraft_count run data get block ~ ~ ~ Items[3].Count 1
execute store result score @s invcraft_glass run data get block ~ ~ ~ Items[3].tag.from_chest 1
execute if entity @s[scores={invcraft_count=1..,invcraft_glass=0}] store result block ~ ~ ~ Items[3].Count byte 1 run scoreboard players remove @s invcraft_count 1
execute store result score @s invcraft_count run data get block ~ ~ ~ Items[2].Count 1
execute store result score @s invcraft_glass run data get block ~ ~ ~ Items[2].tag.from_chest 1
execute if entity @s[scores={invcraft_count=1..,invcraft_glass=0}] store result block ~ ~ ~ Items[2].Count byte 1 run scoreboard players remove @s invcraft_count 1
execute store result score @s invcraft_count run data get block ~ ~ ~ Items[1].Count 1
execute store result score @s invcraft_glass run data get block ~ ~ ~ Items[1].tag.from_chest 1
execute if entity @s[scores={invcraft_count=1..,invcraft_glass=0}] store result block ~ ~ ~ Items[1].Count byte 1 run scoreboard players remove @s invcraft_count 1
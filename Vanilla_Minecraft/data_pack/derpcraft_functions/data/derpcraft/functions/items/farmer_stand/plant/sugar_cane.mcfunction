execute unless block ~ ~ ~ minecraft:sugar_cane if block ~ ~-1 ~ minecraft:sugar_cane run setblock ~ ~ ~ minecraft:sugar_cane
execute unless block ~ ~ ~ minecraft:sugar_cane unless block ~ ~-1 ~ minecraft:sugar_cane if block ~ ~-1 ~ #derpcraft:farmer_stand/sugar_cane/bottom if block ~1 ~-1 ~ #derpcraft:farmer_stand/sugar_cane/hydration run setblock ~ ~ ~ minecraft:sugar_cane
execute unless block ~ ~ ~ minecraft:sugar_cane unless block ~ ~-1 ~ minecraft:sugar_cane if block ~ ~-1 ~ #derpcraft:farmer_stand/sugar_cane/bottom if block ~-1 ~-1 ~ #derpcraft:farmer_stand/sugar_cane/hydration run setblock ~ ~ ~ minecraft:sugar_cane
execute unless block ~ ~ ~ minecraft:sugar_cane unless block ~ ~-1 ~ minecraft:sugar_cane if block ~ ~-1 ~ #derpcraft:farmer_stand/sugar_cane/bottom if block ~ ~-1 ~1 #derpcraft:farmer_stand/sugar_cane/hydration run setblock ~ ~ ~ minecraft:sugar_cane
execute unless block ~ ~ ~ minecraft:sugar_cane unless block ~ ~-1 ~ minecraft:sugar_cane if block ~ ~-1 ~ #derpcraft:farmer_stand/sugar_cane/bottom if block ~ ~-1 ~-1 #derpcraft:farmer_stand/sugar_cane/hydration run setblock ~ ~ ~ minecraft:sugar_cane
execute if block ~ ~ ~ minecraft:sugar_cane run kill @e[type=minecraft:item,dx=1,dy=1,dz=1,nbt={Item:{id:"minecraft:sugar_cane"}}]
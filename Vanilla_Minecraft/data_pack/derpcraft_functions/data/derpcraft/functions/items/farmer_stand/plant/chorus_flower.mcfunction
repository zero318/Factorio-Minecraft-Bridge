execute unless block ~ ~ ~ minecraft:chorus_flower if block ~ ~-1 ~ #derpcraft:farmer_stand/chorus_flower/down run setblock ~ ~ ~ minecraft:chorus_flower
#execute unless block ~ ~ ~ minecraft:chorus_flower if block ~1 ~ ~ minecraft:chorus_plant run setblock ~ ~ ~ minecraft:chorus_flower
#execute unless block ~ ~ ~ minecraft:chorus_flower if block ~-1 ~ ~ minecraft:chorus_plant run setblock ~ ~ ~ minecraft:chorus_flower
#execute unless block ~ ~ ~ minecraft:chorus_flower if block ~ ~ ~1 minecraft:chorus_plant run setblock ~ ~ ~ minecraft:chorus_flower
#execute unless block ~ ~ ~ minecraft:chorus_flower if block ~ ~ ~-1 minecraft:chorus_plant run setblock ~ ~ ~ minecraft:chorus_flower
execute if block ~ ~ ~ minecraft:chorus_flower run kill @e[type=minecraft:item,dx=1,dy=1,dz=1,nbt={Item:{id:"minecraft:chorus_flower"}}]
#
##Buried Treasure
##
#tag @s[advancements={derpcraft:music/natural_music/selectors={buried_treasure=true}}] add Buried_Treasure
#execute if entity @s[advancements={derpcraft:music/natural_music/selectors={buried_treasure=false}}] unless block ~ ~-1 ~ #derpcraft:features/buried_treasure run tag @s remove Buried_Treasure
##
##Desert Pyramid
##
#tag @s[advancements={derpcraft:music/natural_music/selectors={desert_pyramid=true}}] add Desert_Pyramid
#execute if entity @s[advancements={derpcraft:music/natural_music/selectors={desert_pyramid=false}}] unless block ~ ~-1 ~ #derpcraft:features/desert_pyramid run tag @s remove Desert_Pyramid
##
##End City
##
#tag @s[advancements={derpcraft:music/natural_music/selectors={end_city=true}}] add EndCity
#execute if entity @s[advancements={derpcraft:music/natural_music/selectors={end_city=false}}] unless block ~ ~-1 ~ #derpcraft:features/end_city run tag @s remove EndCity
##
##Fortress
##
#tag @s[advancements={derpcraft:music/natural_music/selectors={fortress=true}}] add Fortress
#execute if entity @s[advancements={derpcraft:music/natural_music/selectors={fortress=false}}] unless block ~ ~-1 ~ #derpcraft:features/fortress run tag @s remove Fortress
##
##Igloo
##
#tag @s[advancements={derpcraft:music/natural_music/selectors={igloo=true}}] add Igloo
#execute if entity @s[advancements={derpcraft:music/natural_music/selectors={igloo=false}}] unless block ~ ~-1 ~ #derpcraft:features/igloo run tag @s remove Igloo
##
##Jungle Pyramid
##
#tag @s[advancements={derpcraft:music/natural_music/selectors={jungle_pyramid=true}}] add Jungle_Pyramid
#execute if entity @s[advancements={derpcraft:music/natural_music/selectors={jungle_pyramid=false}}] unless block ~ ~-1 ~ #derpcraft:features/jungle_pyramid run tag @s remove Jungle_Pyramid
##
##Mansion
##
#tag @s[advancements={derpcraft:music/natural_music/selectors={mansion=true}}] add Mansion
##execute if score @s Biome matches 29 if entity @e[type=minecraft:vindicator,distance=..20] if block ~ ~-1 ~ #derpcraft:features/mansion run tag @s add Mansion
##execute if score @s Biome matches 29 if entity @e[type=minecraft:vindicator,distance=..20] if block ~ ~ ~ #derpcraft:features/mansion run tag @s add Mansion
##execute if score @s Biome matches 29 if entity @e[type=minecraft:evoker,distance=..20] if block ~ ~-1 ~ #derpcraft:features/mansion run tag @s add Mansion
##execute if score @s Biome matches 29 if entity @e[type=minecraft:evoker,distance=..20] if block ~ ~ ~ #derpcraft:features/mansion run tag @s add Mansion
##execute if score @s Biome matches 29 if entity @e[type=minecraft:illusioner,distance=..20] if block ~ ~-1 ~ #derpcraft:features/mansion run tag @s add Mansion
##execute if score @s Biome matches 29 if entity @e[type=minecraft:illusioner,distance=..20] if block ~ ~ ~ #derpcraft:features/mansion run tag @s add Mansion
##execute if score @s Biome matches 29 if entity @e[type=minecraft:evoker_fangs,distance=..20] if block ~ ~-1 ~ #derpcraft:features/mansion run tag @s add Mansion
##execute if score @s Biome matches 29 if entity @e[type=minecraft:evoker_fangs,distance=..20] if block ~ ~ ~ #derpcraft:features/mansion run tag @s add Mansion
##execute if score @s Biome matches 29 if entity @e[type=minecraft:vex,distance=..20] if block ~ ~-1 ~ #derpcraft:features/mansion run tag @s add Mansion
##execute if score @s Biome matches 29 if entity @e[type=minecraft:vex,distance=..20] if block ~ ~ ~ #derpcraft:features/mansion run tag @s add Mansion
##execute if score @s Biome matches 157 if entity @e[type=minecraft:vindicator,distance=..20] if block ~ ~-1 ~ #derpcraft:features/mansion run tag @s add Mansion
##execute if score @s Biome matches 157 if entity @e[type=minecraft:vindicator,distance=..20] if block ~ ~ ~ #derpcraft:features/mansion run tag @s add Mansion
##execute if score @s Biome matches 157 if entity @e[type=minecraft:evoker,distance=..20] if block ~ ~-1 ~ #derpcraft:features/mansion run tag @s add Mansion
##execute if score @s Biome matches 157 if entity @e[type=minecraft:evoker,distance=..20] if block ~ ~ ~ #derpcraft:features/mansion run tag @s add Mansion
##execute if score @s Biome matches 157 if entity @e[type=minecraft:illusioner,distance=..20] if block ~ ~-1 ~ #derpcraft:features/mansion run tag @s add Mansion
##execute if score @s Biome matches 157 if entity @e[type=minecraft:illusioner,distance=..20] if block ~ ~ ~ #derpcraft:features/mansion run tag @s add Mansion
##execute if score @s Biome matches 157 if entity @e[type=minecraft:evoker_fangs,distance=..20] if block ~ ~-1 ~ #derpcraft:features/mansion run tag @s add Mansion
##execute if score @s Biome matches 157 if entity @e[type=minecraft:evoker_fangs,distance=..20] if block ~ ~ ~ #derpcraft:features/mansion run tag @s add Mansion
##execute if score @s Biome matches 157 if entity @e[type=minecraft:vex,distance=..20] if block ~ ~-1 ~ #derpcraft:features/mansion run tag @s add Mansion
##execute if score @s Biome matches 157 if entity @e[type=minecraft:vex,distance=..20] if block ~ ~ ~ #derpcraft:features/mansion run tag @s add Mansion
##execute if entity @s[advancements={derpcraft:music/natural_music/selectors={mansion=false}}] unless entity @e[type=minecraft:vindicator,distance=..20] unless entity @e[type=minecraft:evoker,distance=..20] unless entity @e[type=minecraft:illusioner,distance=..20] unless entity @e[type=minecraft:vex,distance=..20] unless entity @e[type=minecraft:evoker_fangs,distance=..20] unless block ~ ~-1 ~ #derpcraft:features/mansion unless block ~ ~ ~ #derpcraft:features/mansion run tag @s remove Mansion
#execute if entity @s[advancements={derpcraft:music/natural_music/selectors={mansion=false}}] unless block ~ ~-1 ~ #derpcraft:features/mansion unless block ~ ~ ~ #derpcraft:features/mansion run tag @s remove Mansion
##
##Mineshaft
##
#tag @s[advancements={derpcraft:music/natural_music/selectors={mineshaft=true}}] add Mineshaft
#execute if entity @s[advancements={derpcraft:music/natural_music/selectors={mineshaft=false}}] unless block ~ ~-1 ~ #derpcraft:features/mineshaft run tag @s remove Mineshaft
##
##Monument
##
#tag @s[advancements={derpcraftderpcraft:music/natural_music/selectors={monument=true}}] add Monument
#execute if entity @s[advancements={derpcraft:music/natural_music/selectors={monument=false}}] unless block ~ ~-1 ~ #derpcraft:features/monument run tag @s remove Monument
##
##Ocean Ruin
##
#tag @s[advancements={derpcraft:music/natural_music/selectors={ocean_ruin=true}}] add Ocean_Ruin
#execute if entity @s[advancements={derpcraft:music/natural_music/selectors={ocean_ruin=false}}] unless block ~ ~-1 ~ #derpcraft:features/ocean_ruin run tag @s remove Ocean_Ruin
##
##Shipwreck
##
#tag @s[advancements={derpcraft:music/natural_music/selectors={shipwreck=true}}] add Shipwreck
#execute if entity @s[advancements={derpcraft:music/natural_music/selectors={shipwreck=false}}] unless block ~ ~-1 ~ #derpcraft:features/shipwreck run tag @s remove Shipwreck
##
##Stronghold
##
#tag @s[advancements={derpcraft:music/natural_music/selectors={stronghold=true}}] add Stronghold
#execute if entity @s[advancements={derpcraft:music/natural_music/selectors={stronghold=false}}] unless block ~ ~-1 ~ #derpcraft:features/stronghold run tag @s remove Stronghold
##
##Swamp Hut
##
#tag @s[advancements={derpcraft:music/natural_music/selectors={swamp_hut=true}}] add Swamp_Hut
#execute if entity @s[advancements={derpcraft:music/natural_music/selectors={swamp_hut=false}}] unless block ~ ~-1 ~ #derpcraft:features/swamp_hut run tag @s remove Swamp_Hut
##
##Village
##
#tag @s[advancements={derpcraft:music/natural_music/selectors={village=true}}] add Village
#execute if entity @s[advancements={derpcraft:music/natural_music/selectors={village=false}}] unless entity @e[type=minecraft:villager,distance=..20] unless block ~ ~-1 ~ #derpcraft:features/village unless block ~ ~ ~ #derpcraft:features/village run tag @s remove Village
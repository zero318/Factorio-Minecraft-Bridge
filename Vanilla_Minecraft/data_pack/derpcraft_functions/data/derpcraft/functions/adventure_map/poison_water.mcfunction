execute as @e[x=-164,y=50,z=-212,dx=183,dy=30,dz=199,type=!wither_skeleton,type=!item,type=!experience_orb,type=!area_effect_cloud,type=!leash_knot,type=!painting,type=!item_frame,type=!armor_stand,type=!end_crystal,type=!egg,type=!arrow,type=!snowball,type=!fireball,type=!small_fireball,type=!ender_pearl,type=!eye_of_ender,type=!potion,type=!experience_bottle,type=!wither_skull,type=!firework_rocket,type=!spectral_arrow,type=!shulker_bullet,type=!dragon_fireball,type=!llama_spit,type=!tnt,type=!falling_block,type=!command_block_minecart,type=!boat,type=!minecart,type=!chest_minecart,type=!furnace_minecart,type=!tnt_minecart,type=!hopper_minecart,type=!spawner_minecart,type=!lightning_bolt,type=!guardian,type=!elder_guardian,type=!drowned,type=!trident,name=!unknown,tag=!NoPoison,type=!spider,type=!cave_spider,type=!slime] at @s if block ~ ~ ~ minecraft:water run tag @s add PoisonWater
scoreboard players add @e[tag=PoisonWater] PoisonTimer 0
scoreboard players set @e[tag=PoisonWater,tag=!NoPoison,scores={PoisonTimer=..-1}] PoisonTimer 0
effect give @e[tag=PoisonWater,tag=!NoPoison,scores={PoisonTimer=0}] minecraft:wither 15 2
scoreboard players set @e[tag=PoisonWater,tag=!NoPoison,scores={PoisonTimer=0}] PoisonTimer 12
scoreboard players remove @e[tag=PoisonWater,tag=!NoPoison,scores={PoisonTimer=1..}] PoisonTimer 1
execute as @e[tag=PoisonWater,tag=!NoPoison] at @s unless block ~ ~ ~ minecraft:water run scoreboard players set @s PoisonTimer -1
scoreboard players set @e[tag=PoisonWater,tag=NoPoison] PoisonTimer -1
effect clear @e[tag=PoisonWater,scores={PoisonTimer=..-1}] minecraft:wither
tag @e[tag=PoisonWater,scores={PoisonTimer=..-1}] remove PoisonWater
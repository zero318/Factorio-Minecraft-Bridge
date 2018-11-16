data merge entity @s {Attributes:[{Base:25.0d,Name:"generic.maxHealth"},{Base:1.0d,Name:"generic.kockbackResistence"},{Base:1.0d,Name:"generic.movementSpeed"},{Base:20.0d,Name:"generic.followRange"},{Base:10.0d,Name:"generic.attackDamage"}],Health:25.0}
execute store result score @s DerpcraftData run data get entity @s Size
execute store result entity @s Size int 1 run scoreboard players add @s DerpcraftData 1
scoreboard players reset @s DerpcraftData
tag @s add LunaticMode
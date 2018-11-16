data merge entity @s {Attributes:[{Base:25.0d,Name:"generic.maxHealth"},{Base:0.25d,Name:"generic.kockbackResistence"},{Base:5.0d,Name:"generic.armor"},{Base:0.275d,Name:"generic.movementSpeed"},{Base:40.0d,Name:"generic.followRange"},{Base:5.0d,Name:"generic.attackDamage"}],Health:25.0,CanBreakDoors:1}
#function derpcraft:rng/main
#execute if entity @s[nbt={HandItems:[{id:"minecraft:iron_sword"}]}] run replaceitem entity @s 
tag @s add LunaticMode
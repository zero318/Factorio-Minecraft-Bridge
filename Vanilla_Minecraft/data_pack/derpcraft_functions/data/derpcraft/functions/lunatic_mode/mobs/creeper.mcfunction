data merge entity @s {Attributes:[{Base:25.0d,Name:"generic.maxHealth"},{Base:0.275d,Name:"generic.movementSpeed"},{Base:20.0d,Name:"generic.followRange"}],ExplosionRadius:6,Fuse:20,Health:25.0}
function derpcraft:rng/main
execute if score @s RNG matches 0..327 run data merge entity @s {ExplosionRadius:9,powered:1}
tag @s add LunaticMode
execute if entity @s[nbt={Rotation:[45.0f]}] run data modify entity @s Rotation[0] set value 90.0f
execute if entity @s[nbt={Rotation:[135.0f]}] run data modify entity @s Rotation[0] set value 180.0f
execute if entity @s[nbt={Rotation:[-135.0f]}] run data modify entity @s Rotation[0] set value -90.0f
execute if entity @s[nbt={Rotation:[-45.0f]}] run data modify entity @s Rotation[0] set value 0.0f
tag @s remove NeedsRotation
tag @s add ChestInitialized
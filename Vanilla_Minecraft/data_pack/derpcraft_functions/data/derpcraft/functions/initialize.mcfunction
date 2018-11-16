scoreboard players set Initialized DerpcraftData 1
scoreboard players set -1 DerpcraftData -1
scoreboard players set 2 DerpcraftData 2
scoreboard players set 90 DerpcraftData 90
scoreboard players set 256 DerpcraftData 256
scoreboard players set 65536 DerpcraftData 65536
tag zero318 add AuthorSwag
scoreboard objectives add DerpcraftID dummy
scoreboard objectives add DerpcraftOwner dummy
scoreboard players set NextDerpcraftID DerpcraftID 0
tag @a remove HasDerpcraftID
#function derpcraft:music/core/initialize
#function derpcraft:items/initialize
#function derpcraft:rng/initialize
function derpcraft:nbt_crafting/initialize
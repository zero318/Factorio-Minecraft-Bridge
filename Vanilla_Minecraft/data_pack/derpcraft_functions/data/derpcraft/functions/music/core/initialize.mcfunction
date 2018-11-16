scoreboard objectives add Music dummy
scoreboard objectives add MusicTimer dummy
scoreboard objectives add AreaMusic dummy
scoreboard objectives add YouAreDead deathCount
scoreboard objectives add MO trigger
scoreboard objectives add JoinedMapReset minecraft.custom:minecraft.leave_game
function derpcraft:music/core/sub_natural/initialize
#
scoreboard players enable @a MO
#
scoreboard players set NaturalMusic DerpcraftData 1
scoreboard players set AdventureMap DerpcraftData 0
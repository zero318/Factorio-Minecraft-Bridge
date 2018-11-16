scoreboard objectives add RNG dummy
scoreboard players set RNG RNG 65536
execute store result score Seed RNG run seed
scoreboard players operation Seed RNG %= RNG RNG
scoreboard players operation RNG RNG = Seed RNG
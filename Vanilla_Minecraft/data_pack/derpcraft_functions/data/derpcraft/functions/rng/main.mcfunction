execute if score RNG RNG matches 22026 run scoreboard players set RNG RNG 0
execute if score RNG RNG matches 21674 run scoreboard players set RNG RNG 1789
#
execute store success score Input15 RNG if score RNG RNG matches 32768..
execute if score Input15 RNG matches 1 run scoreboard players remove RNG RNG 32768
execute store success score Input14 RNG if score RNG RNG matches 16384..
execute if score Input14 RNG matches 1 run scoreboard players remove RNG RNG 16384
execute store success score Input13 RNG if score RNG RNG matches 8192..
execute if score Input13 RNG matches 1 run scoreboard players remove RNG RNG 8192
execute store success score Input12 RNG if score RNG RNG matches 4096..
execute if score Input12 RNG matches 1 run scoreboard players remove RNG RNG 4096
execute store success score Input11 RNG if score RNG RNG matches 2048..
execute if score Input11 RNG matches 1 run scoreboard players remove RNG RNG 2048
execute store success score Input10 RNG if score RNG RNG matches 1024..
execute if score Input10 RNG matches 1 run scoreboard players remove RNG RNG 1024
execute store success score Input9 RNG if score RNG RNG matches 512..
execute if score Input9 RNG matches 1 run scoreboard players remove RNG RNG 512
execute store success score Input8 RNG if score RNG RNG matches 256..
execute if score Input8 RNG matches 1 run scoreboard players remove RNG RNG 256
execute store success score Input7 RNG if score RNG RNG matches 128..
execute if score Input7 RNG matches 1 run scoreboard players remove RNG RNG 128
execute store success score Input6 RNG if score RNG RNG matches 64..
execute if score Input6 RNG matches 1 run scoreboard players remove RNG RNG 64
execute store success score Input5 RNG if score RNG RNG matches 32..
execute if score Input5 RNG matches 1 run scoreboard players remove RNG RNG 32
execute store success score Input4 RNG if score RNG RNG matches 16..
execute if score Input4 RNG matches 1 run scoreboard players remove RNG RNG 16
execute store success score Input3 RNG if score RNG RNG matches 8..
execute if score Input3 RNG matches 1 run scoreboard players remove RNG RNG 8
execute store success score Input2 RNG if score RNG RNG matches 4..
execute if score Input2 RNG matches 1 run scoreboard players remove RNG RNG 4
execute store success score Input1 RNG if score RNG RNG matches 2..
execute if score Input1 RNG matches 1 run scoreboard players remove RNG RNG 2
execute store success score Input0 RNG if score RNG RNG matches 1..
execute if score Input0 RNG matches 1 run scoreboard players remove RNG RNG 1
#
execute store success score S0_15 RNG unless score Input15 RNG = Input7 RNG
execute store success score S0_14 RNG unless score Input14 RNG = Input6 RNG
execute store success score S0_13 RNG unless score Input13 RNG = Input5 RNG
execute store success score S0_12 RNG unless score Input12 RNG = Input4 RNG
execute store success score S0_11 RNG unless score Input11 RNG = Input3 RNG
execute store success score S0_10 RNG unless score Input10 RNG = Input2 RNG
execute store success score S0_9 RNG unless score Input9 RNG = Input1 RNG
execute store success score S0_8 RNG unless score Input8 RNG = Input0 RNG
scoreboard players operation S0_7 RNG = Input7 RNG
scoreboard players operation S0_6 RNG = Input6 RNG
scoreboard players operation S0_5 RNG = Input5 RNG
scoreboard players operation S0_4 RNG = Input4 RNG
scoreboard players operation S0_3 RNG = Input3 RNG
scoreboard players operation S0_2 RNG = Input2 RNG
scoreboard players operation S0_1 RNG = Input1 RNG
scoreboard players operation S0_0 RNG = Input0 RNG
#
scoreboard players operation Input15 RNG = S0_7 RNG
scoreboard players operation Input14 RNG = S0_6 RNG
scoreboard players operation Input13 RNG = S0_5 RNG
scoreboard players operation Input12 RNG = S0_4 RNG
scoreboard players operation Input11 RNG = S0_3 RNG
scoreboard players operation Input10 RNG = S0_2 RNG
scoreboard players operation Input9 RNG = S0_1 RNG
scoreboard players operation Input8 RNG = S0_0 RNG
scoreboard players operation Input7 RNG = S0_15 RNG
scoreboard players operation Input6 RNG = S0_14 RNG
scoreboard players operation Input5 RNG = S0_13 RNG
scoreboard players operation Input4 RNG = S0_12 RNG
scoreboard players operation Input3 RNG = S0_11 RNG
scoreboard players operation Input2 RNG = S0_10 RNG
scoreboard players operation Input1 RNG = S0_9 RNG
scoreboard players operation Input0 RNG = S0_8 RNG
#
scoreboard players operation S0_15 RNG = Input15 RNG
scoreboard players operation S0_14 RNG = Input14 RNG
scoreboard players operation S0_13 RNG = Input13 RNG
scoreboard players operation S0_12 RNG = Input12 RNG
scoreboard players operation S0_11 RNG = Input11 RNG
scoreboard players operation S0_10 RNG = Input10 RNG
scoreboard players operation S0_9 RNG = Input9 RNG
execute store success score S0_8 RNG unless score Input8 RNG = S0_7 RNG
execute store success score S0_7 RNG unless score Input7 RNG = S0_6 RNG
execute store success score S0_6 RNG unless score Input6 RNG = S0_5 RNG
execute store success score S0_5 RNG unless score Input5 RNG = S0_4 RNG
execute store success score S0_4 RNG unless score Input4 RNG = S0_3 RNG
execute store success score S0_3 RNG unless score Input3 RNG = S0_2 RNG
execute store success score S0_2 RNG unless score Input2 RNG = S0_1 RNG
execute store success score S0_1 RNG unless score Input1 RNG = S0_0 RNG
scoreboard players operation S0_0 RNG = Input0 RNG
#
scoreboard players set S1_15 RNG 1
execute store success score S1_14 RNG unless score S0_15 RNG matches 1
execute store success score S1_13 RNG unless score S0_14 RNG matches 1
execute store success score S1_12 RNG unless score S0_13 RNG matches 1
execute store success score S1_11 RNG unless score S0_12 RNG matches 1
execute store success score S1_10 RNG unless score S0_11 RNG matches 1
execute store success score S1_9 RNG unless score S0_10 RNG matches 1
execute store success score S1_8 RNG unless score S0_9 RNG matches 1
execute store success score S1_7 RNG unless score S0_8 RNG matches 1
execute store success score S1_6 RNG unless score S0_7 RNG matches 0
execute store success score S1_5 RNG unless score S0_6 RNG matches 0
execute store success score S1_4 RNG unless score S0_5 RNG matches 0
execute store success score S1_3 RNG unless score S0_4 RNG matches 0
execute store success score S1_2 RNG unless score S0_3 RNG matches 0
execute store success score S1_1 RNG unless score S0_2 RNG matches 0
execute store success score S1_0 RNG unless score S0_1 RNG matches 0
#
execute if score S0_0 RNG matches 1 store success score Input15 RNG unless score S1_15 RNG matches 1
execute if score S0_0 RNG matches 0 run scoreboard players operation Input15 RNG = S1_15 RNG
scoreboard players operation Input14 RNG = S1_14 RNG
scoreboard players operation Input13 RNG = S1_13 RNG
execute if score S0_0 RNG matches 1 run scoreboard players operation Input12 RNG = S1_12 RNG
execute if score S0_0 RNG matches 0 store success score Input12 RNG unless score S1_12 RNG matches 1
execute if score S0_0 RNG matches 1 run scoreboard players operation Input11 RNG = S1_11 RNG
execute if score S0_0 RNG matches 0 store success score Input11 RNG unless score S1_11 RNG matches 1
execute if score S0_0 RNG matches 1 run scoreboard players operation Input10 RNG = S1_10 RNG
execute if score S0_0 RNG matches 0 store success score Input10 RNG unless score S1_10 RNG matches 1
execute if score S0_0 RNG matches 1 run scoreboard players operation Input9 RNG = S1_9 RNG
execute if score S0_0 RNG matches 0 store success score Input9 RNG unless score S1_9 RNG matches 1
execute store success score Input8 RNG unless score S1_8 RNG matches 1
execute store success score Input7 RNG unless score S1_7 RNG matches 1
execute if score S0_0 RNG matches 1 run scoreboard players operation Input6 RNG = S1_6 RNG
execute if score S0_0 RNG matches 0 store success score Input6 RNG unless score S1_6 RNG matches 1
execute if score S0_0 RNG matches 1 run scoreboard players operation Input5 RNG = S1_5 RNG
execute if score S0_0 RNG matches 0 store success score Input5 RNG unless score S1_5 RNG matches 1
execute if score S0_0 RNG matches 1 run scoreboard players operation Input4 RNG = S1_4 RNG
execute if score S0_0 RNG matches 0 store success score Input4 RNG unless score S1_4 RNG matches 1
scoreboard players operation Input3 RNG = S1_3 RNG
execute if score S0_0 RNG matches 1 run scoreboard players operation Input2 RNG = S1_2 RNG
execute if score S0_0 RNG matches 0 store success score Input2 RNG unless score S1_2 RNG matches 1
scoreboard players operation Input1 RNG = S1_1 RNG
scoreboard players operation Input0 RNG = S1_0 RNG
#
execute if score Input15 RNG matches 1 run scoreboard players add RNG RNG 32768
execute if score Input14 RNG matches 1 run scoreboard players add RNG RNG 16384
execute if score Input13 RNG matches 1 run scoreboard players add RNG RNG 8192
execute if score Input12 RNG matches 1 run scoreboard players add RNG RNG 4096
execute if score Input11 RNG matches 1 run scoreboard players add RNG RNG 2048
execute if score Input10 RNG matches 1 run scoreboard players add RNG RNG 1024
execute if score Input9 RNG matches 1 run scoreboard players add RNG RNG 512
execute if score Input8 RNG matches 1 run scoreboard players add RNG RNG 256
execute if score Input7 RNG matches 1 run scoreboard players add RNG RNG 128
execute if score Input6 RNG matches 1 run scoreboard players add RNG RNG 64
execute if score Input5 RNG matches 1 run scoreboard players add RNG RNG 32
execute if score Input4 RNG matches 1 run scoreboard players add RNG RNG 16
execute if score Input3 RNG matches 1 run scoreboard players add RNG RNG 8
execute if score Input2 RNG matches 1 run scoreboard players add RNG RNG 4
execute if score Input1 RNG matches 1 run scoreboard players add RNG RNG 2
execute if score Input0 RNG matches 1 run scoreboard players add RNG RNG 1
#
execute if entity @s run scoreboard players operation @s RNG = RNG RNG
#
#scoreboard players add Index RNG 1
#execute if score Index RNG matches 65114 run scoreboard players set Index RNG 0
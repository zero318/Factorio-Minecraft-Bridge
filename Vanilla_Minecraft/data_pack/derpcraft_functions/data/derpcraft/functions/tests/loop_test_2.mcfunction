scoreboard players add Dummy Dummy 1
tellraw @a [{"text":""},{"selector":"@s"},{"text":" "},{"score":{"name":"Dummy","objective":"Dummy"}}]
execute unless score Dummy Dummy matches 10.. run function derpcraft:subroutines/loop_test_2
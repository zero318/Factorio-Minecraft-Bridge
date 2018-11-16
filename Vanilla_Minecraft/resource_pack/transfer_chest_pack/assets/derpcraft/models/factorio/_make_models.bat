@echo off
setlocal EnableDelayedExpansion
SET "LETTERS=0ABCDEFGHIJKLMNOPQRSTUVWXYZ"
echo !LETTERS:~5,1!
pause
FOR /F "delims=: skip=13 tokens=5 usebackq" %%G in ("F:\My Minecraft Expansion\.minecraft\resourcepacks\transfer_chest_pack\assets\minecraft\models\item\ink_sac.json") do (
    FOR /F delims^=^"^ tokens^=1 %%H in ("%%G") do (
        SET /A "_TokenCount=0"
        
        FOR /F "delims=/ tokens=1,2,3" %%I in ("%%H") do (
            SET /A "_TokenCount=!_TokenCount!+1"
        )
        echo !_TokenCount!
    )
)
pause
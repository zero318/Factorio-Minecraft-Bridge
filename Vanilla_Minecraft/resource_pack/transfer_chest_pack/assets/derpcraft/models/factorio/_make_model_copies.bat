@echo off
setlocal EnableDelayedExpansion
set /p "_count=How many damage values? "
if not exist "%~dp0\%~n1\" (md %~n1)
for /l %%g in (1,1,%_count%) do (
    set "_output=%~dp0\%~n1\damage_%%g.json"
    echo {>!_output!
    echo     "parent": "item/generated",>>!_output!
    echo     "textures": {>>!_output!
    echo         "layer0": "derpcraft:item/%~n1/damage_%%g">>!_output!
    echo     }>>!_output!
    echo }>>!_output!
    echo:>>!_output!
)
move /y "%~n1.json" "%~dp0\z_done\">nul
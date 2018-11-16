@echo off
setlocal EnableDelayedExpansion

set "_Batch_Path=%~dp0"
set /p _Factorio_Data=<_factorio_data_directory.txt
set /p _Factorio_Mods=<_factorio_extracted_mods_directory.txt
set _Work_Dir=%cd%
set _Predicate=        { "predicate": { "custom_model_data": 
set _Model= }, "model": "
set _Line_End=" },
set _Item_Mapping=minecraft:ink_sac{CustomModelData:
set _Display_Name=,display:{Name:"{\"italic\":false,\"text\":\"
set /a _Custom_Model_Data=0

IF EXIST item_mappings.txt (
    DEL /F /Q item_mappings.txt
)
IF NOT EXIST minecraft\ (
    md minecraft
)
::Resource Pack
PUSHD minecraft
IF NOT EXIST models\ (
    md models
)
::Resource Pack
::Resource Pack\minecraft
PUSHD models
IF NOT EXIST item\ (
    md item
)
::Resource Pack
::Resource Pack\minecraft
::Resource Pack\minecraft\models
PUSHD item
IF EXIST black_dye.json (
    DEL /F /Q black_dye.json
)
(
echo {
echo     "parent": "item/generated",
echo     "textures": {
echo         "layer0": "item/ink_sac"
echo     }
echo }
)>black_dye.json
IF EXIST ink_sac.json (
    DEL /F /Q ink_sac.json
)
(
echo {
echo     "parent": "item/generated",
echo     "textures": {
echo         "layer0": "item/ink_sac"
echo     },
echo     "overrides": [
echo %_Predicate%1%_Model%derpcraft:custom_guis/ender_crafting%_Line_End%
echo %_Predicate%2%_Model%item/barrier%_Line_End%
echo %_Predicate%3%_Model%derpcraft:custom_guis/ender_crafting_empty%_Line_End%
echo %_Predicate%4%_Model%fmcbridge:block/tcrblock%_Line_End%
echo %_Predicate%5%_Model%fmcbridge:block/tcsblock%_Line_End%
echo %_Predicate%6%_Model%fmcbridge:block/tcrmanagerblock%_Line_End%
echo %_Predicate%7%_Model%fmcbridge:block/tcsmanagerblock%_Line_End%
)>ink_sac.json
IF EXIST poisonous_potato.json (
    DEL /F /Q poisonous_potato.json
)
(
echo {
echo     "parent": "item/generated",
echo     "textures": {
echo         "layer0": "item/poisonous_potato"
echo     },
echo     "overrides": [
echo %_Predicate%1%_Model%derpcraft:custom_guis/ender_crafting%_Line_End%
echo %_Predicate%2%_Model%item/barrier%_Line_End%
echo %_Predicate%3%_Model%derpcraft:custom_guis/ender_crafting_empty%_Line_End%
echo %_Predicate%4%_Model%fmcbridge:block/tcrblock%_Line_End%
echo %_Predicate%5%_Model%fmcbridge:block/tcsblock%_Line_End%
echo %_Predicate%6%_Model%fmcbridge:block/tcrmanagerblock%_Line_End%
echo %_Predicate%7%_Model%fmcbridge:block/tcsmanagerblock%_Line_End%
)>poisonous_potato.json
SET /a _Custom_Model_Data=8
POPD
::Resource Pack
::Resource Pack\minecraft
POPD
::Resource Pack
POPD
IF EXIST factorio\ (
    DEL /F /S /Q factorio
)
IF NOT EXIST factorio\ (
    md factorio
)
::Resource Pack
PUSHD factorio
IF NOT EXIST textures\ (
    md textures
)
::Resource Pack
::Resource Pack\factorio
PUSHD textures
IF NOT EXIST base\ (
    md base
)
::Resource Pack
::Resource Pack\factorio
::Resource Pack\factorio\textures
PUSHD base
::Resource Pack
::Resource Pack\factorio
::Resource Pack\factorio\textures
::Resource Pack\factorio\textures\base
PUSHD %_Factorio_Data%\base\graphics
FOR /F %%G in ('dir /A:D /b') do (
    IF /I NOT %%G==decorative (
        IF /I NOT %%G==entity (
            IF /I NOT %%G==equipment (
                IF /I NOT %%G==terrain (
                    set "_Work_Dir=%cd%"
                    POPD
                    ::Resource Pack
                    ::Resource Pack\factorio
                    ::Resource Pack\factorio\textures
                    IF NOT EXIST %%G\ (
                        md %%G
                    )
                    robocopy "!_Work_Dir!\%%G" %%G /S
                    ::Resource Pack
                    ::Resource Pack\factorio
                    ::Resource Pack\factorio\textures
                    ::Resource Pack\factorio\textures\base
                    PUSHD %_Factorio_Data%\base\graphics
                )
            )
        )
    )
)
POPD
::Resource Pack
::Resource Pack\factorio
::Resource Pack\factorio\textures
POPD
::Resource Pack
::Resource Pack\factorio
IF NOT EXIST core\ (
    md core
)
::Resource Pack
::Resource Pack\factorio
::Resource Pack\factorio\textures
PUSHD core
::Resource Pack
::Resource Pack\factorio
::Resource Pack\factorio\textures
::Resource Pack\factorio\textures\core
PUSHD %_Factorio_Data%\core\graphics
FOR /F %%G in ('dir /A:D /b') do (
    IF /I NOT %%G==shaders (
        set "_Work_Dir=!cd!"
        POPD
        ::Resource Pack
        ::Resource Pack\factorio
        ::Resource Pack\factorio\textures
        IF NOT EXIST %%G\ (
            md %%G
        )
        robocopy "!_Work_Dir!\%%G" %%G /S
        ::Resource Pack
        ::Resource Pack\factorio
        ::Resource Pack\factorio\textures
        ::Resource Pack\factorio\textures\core
        PUSHD %_Factorio_Data%\core\graphics
    )
)
echo:
FOR /F %%G in ('dir /A:-D /b') do (
    echo %%G
    set "_Work_Dir=!cd!"
    POPD
    ::Resource Pack
    ::Resource Pack\factorio
    ::Resource Pack\factorio\textures
    robocopy "!_Work_Dir!" "!cd!" %%G
    ::Resource Pack
    ::Resource Pack\factorio
    ::Resource Pack\factorio\textures
    ::Resource Pack\factorio\textures\core
    PUSHD %_Factorio_Data%\core\graphics
)
POPD
::Resource Pack
::Resource Pack\factorio
::Resource Pack\factorio\textures
POPD
::Resource Pack
::Resource Pack\factorio
FOR /F "usebackq" %%G in ("%_Batch_Path%\_factorio_mods_to_import.txt") do (
    IF EXIST %_Factorio_Mods%\%%G (
        IF NOT EXIST %%G\ (
            md %%G
        )
        ::Resource Pack
        ::Resource Pack\factorio
        ::Resource Pack\factorio\textures
        PUSHD %%G
        ::Resource Pack
        ::Resource Pack\factorio
        ::Resource Pack\factorio\textures
        ::Resource Pack\factorio\textures\%%G
        PUSHD %_Factorio_Mods%\%%G\%%G
        IF EXIST graphics\ (
            cd graphics
            FOR /F %%H in ('dir /A:D /b') do (
                IF /I NOT %%H==decorative (
                    IF /I NOT %%H==entity (
                        IF /I NOT %%H==equipment (
                            IF /I NOT %%H==terrain (
                                IF /I NOT %%H==component (
                                    IF /I NOT %%H==factory (
                                        IF /I NOT %%H==tile (
                                            IF /I NOT %%H==utility (
                                                IF /I NOT %%H==insert-entity (
                                                    IF /I NOT %%H==entities (
                                                        IF /I NOT %%H==gui (
                                                            IF /I NOT %%H==fluid-generator (
                                                                IF /I NOT %%H==solar-panel (
                                                                    IF /I NOT %%H==indicator (
                                                                        set "_Work_Dir=!cd!"
                                                                        POPD
                                                                        ::Resource Pack
                                                                        ::Resource Pack\factorio
                                                                        ::Resource Pack\factorio\textures
                                                                        IF NOT EXIST %%H\ (
                                                                            md %%H
                                                                        )
                                                                        robocopy "!_Work_Dir!\%%H" %%H /S
                                                                        ::Resource Pack
                                                                        ::Resource Pack\factorio
                                                                        ::Resource Pack\factorio\textures
                                                                        ::Resource Pack\factorio\textures\%%G
                                                                        PUSHD %_Factorio_Mods%\%%G\%%G\graphics
                                                                    )
                                                                )
                                                            )
                                                        )
                                                    )
                                                )
                                            )
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
            FOR /F %%H in ('dir /A:-D /b') do (
                set "_Work_Dir=!cd!"
                POPD
                ::Resource Pack
                ::Resource Pack\factorio
                ::Resource Pack\factorio\textures
                robocopy "!_Work_Dir!" "!cd!" %%H
                ::Resource Pack
                ::Resource Pack\factorio
                ::Resource Pack\factorio\textures
                ::Resource Pack\factorio\textures\%%G
                PUSHD %_Factorio_Mods%\%%G\%%G\graphics
            )
        )
        POPD
        ::Resource Pack
        ::Resource Pack\factorio
        ::Resource Pack\factorio\textures
        POPD
        ::Resource Pack
        ::Resource Pack\factorio
    )
)
FOR /F "tokens=*" %%G in ('cmd /c "echo %cd%& dir /l/b/ad/s"') do (
    FOR /F "tokens=*" %%H in ('dir /l/b "%%G"') do (
        REN "%%G"\"%%H" "%%H"
    )
)
IF EXIST "F:\My Programs Expansion\ImageMagick-7.0.8-14-portable-Q16-x64\convert.exe" (
    FOR /R "%cd%" %%G in (*.png) do (
        "F:\My Programs Expansion\ImageMagick-7.0.8-14-portable-Q16-x64\convert.exe" "%%G" -channel a -threshold 50%%%% +channel "%%G"
    )
)
POPD
::Resource Pack
IF NOT EXIST models\ (
    md models
)
robocopy "%cd%\textures" "%cd%\models" * /S /CREATE
::Resource Pack
::Resource Pack\factorio
PUSHD models
FOR /R "%cd%" %%G in (*.png) do (
    REN "%%G" *.json
)
FOR /R "%cd%" %%G in (*.db) do (
    DEL /F /Q %%G
)
FOR /F "tokens=*" %%G in ('dir /b/a-d/s') do (
    SET _Temp=%%~dpnG
    SET _Temp2=!_Temp:%cd%\=!
    SET _Temp3=factorio:!_Temp2:\=/!
    (
    echo {
    echo     "parent": "item/generated",
    echo     "textures": {
    echo         "layer0": "!_Temp3!"
    echo     }
    echo }
    )>%%G
    echo %_Predicate%!_Custom_Model_Data!%_Model%!_Temp3!%_Line_End%>>..\..\minecraft\models\item\ink_sac.json
    echo %_Predicate%!_Custom_Model_Data!%_Model%!_Temp3!%_Line_End%>>..\..\minecraft\models\item\poisonous_potato.json
    echo %_Item_Mapping%!_Custom_Model_Data!%_Display_Name%%%~nG\"}"}}=%%~nG>>..\..\item_mappings.txt
    SET /a _Custom_Model_Data=!_Custom_Model_Data!+1
)
(
echo %_Predicate%%_Custom_Model_Data%%_Model%item/barrier" }
echo     ]
echo }
)>>..\..\minecraft\models\item\ink_sac.json
(
echo %_Predicate%%_Custom_Model_Data%%_Model%item/barrier" }
echo     ]
echo }
)>>..\..\minecraft\models\item\poisonous_potato.json
POPD
::Resource Pack
POPD
echo Import Complete
echo:
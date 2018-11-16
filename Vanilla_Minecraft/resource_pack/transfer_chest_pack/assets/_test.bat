SET /a _Width=0
SET /a _Height=0
FOR /F "usebackq tokens=*" %%H in (`CALL "F:\My Programs Expansion\ImageMagick-7.0.8-14-portable-Q16-x64\identify.exe" -format "%%%w" "achievement-labels.png"`) do (
    SET /a _Width=%%H
)
FOR /F "usebackq tokens=*" %%H in (`CALL "F:\My Programs Expansion\ImageMagick-7.0.8-14-portable-Q16-x64\identify.exe" -format "%%%h" "achievement-labels.png"`) do (
    SET /a _Height=%%H
)
IF /I NOT %_Width%==%_Height% (
    DEL /F /Q achievement-labels.png
)
pause

@echo on
SET /a _Height=0
SET /a _Width=0
IF EXIST "F:\My Programs Expansion\ImageMagick-7.0.8-14-portable-Q16-x64\identify.exe" (
    FOR /R "%cd%" %%G in (*.png) do (
        FOR /F "usebackq tokens=*" %%H in (`CALL "F:\My Programs Expansion\ImageMagick-7.0.8-14-portable-Q16-x64\identify.exe" -format "%%%w" "%%G"`) do (
            SET /a _Width=%%H
        )
        FOR /F "usebackq tokens=*" %%H in (`CALL "F:\My Programs Expansion\ImageMagick-7.0.8-14-portable-Q16-x64\identify.exe" -format "%%%h" "%%G"`) do (
            SET /a _Height=%%H
        )
        IF /I NOT !_Width!==!_Height! (
            DEL /F /Q "%%G"
        )
    )
)
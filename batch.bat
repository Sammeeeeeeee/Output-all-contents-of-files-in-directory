@echo off

setlocal enabledelayedexpansion
set count=1
for %%f in (*) do (
    echo !count!. %%~nxf
    set /a count+=1
)

set /p selection=Enter the numbers of the files you want to view (separated by space):
for %%n in (%selection%) do (
    for %%f in (*) do (
        set /a filecount+=1
        if !filecount! equ %%n (
            echo %%~nxf:
            type "%%f"
            echo.
        )
    )
    set filecount=0
)

set /p save=Do you want to save the contents to a results.txt? (Y/N)
if /i "%save%"=="Y" (
    (for %%n in (%selection%) do (
        for %%f in (*) do (
            set /a filecount+=1
            if !filecount! equ %%n (
                echo %%~nxf:
                type "%%f"
                echo.
            )
        )
        set filecount=0
    )) > results.txt && echo Saved.
)
echo Exiting and removing script...

del "%~f0" 2>nul

exit /b
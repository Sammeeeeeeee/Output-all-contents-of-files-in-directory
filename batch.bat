@echo off

REM List all files in the directory with numbers
setlocal enabledelayedexpansion
set count=1
for %%f in (*) do (
    echo !count!. %%~nxf
    set /a count+=1
)

REM Prompt user to input numbers
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

REM Save contents to results.txt
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
    )) > results.txt
)

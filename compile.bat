@echo off
setlocal enabledelayedexpansion

:: Capture the start time
set "start_time=!time!"
set "script_path=%~dp0"
set "engine=%script_path%engine"
set "main=main"
set "love=%script_path%engine\love.exe"
for %%A in ("%CD%") do set "name=%%~nxA"
set "to_zip=%script_path%%main%"
mkdir output
set "out=%script_path%output\%name%.love"
set "fin=%script_path%output\%name%.exe"

"C:\Program Files (x86)\7-Zip\7z.exe" a -tzip "%out%" "%to_zip%\*"

copy /b "%love%" + "%out%" "%fin%"
del /f "%out%"

:: Capture the end time
set "end_time=!time!"

:: Calculate the time difference
set "start_seconds=!start_time:~6,1!"
set "start_milliseconds=!start_time:~9,2!"
set "end_seconds=!end_time:~6,1!"
set "end_milliseconds=!end_time:~9,2!"

set /a "elapsed_time_seconds=end_seconds-start_seconds"
set /a "elapsed_time_milliseconds=end_milliseconds-start_milliseconds"

echo Execution time: !elapsed_time_seconds!.!elapsed_time_milliseconds! seconds

endlocal

pause

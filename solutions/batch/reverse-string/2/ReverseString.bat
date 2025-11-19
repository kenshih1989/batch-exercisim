@echo off
setlocal enabledelayedexpansion

set "str=%~1"
set "rev="

if not defined str (
  echo.
  exit /b 0
)

:Loop
if "!str!"=="" (
  echo !rev!
  exit /b 0
)

set "lastStr=!str:~-1!"
set "rev=!rev!!lastStr!"
set "str=!str:~0,-1!"
GOTO :Loop

@echo off
setlocal EnableDelayedExpansion

set "input=%~1"
set "grains="

REM Validate the input
if "!input!" == "" GOTO :invalid_input
if !input! LSS 1 GOTO :invalid_input
if !input! GTR 31 GOTO :invalid_input

REM Calculate grains on the given input
REM Grains = 2^(input-1)
set /a power=input-1
set /a grains=1

REM Calculate 2^power using loop
for /L %%i in (1,1,!power!) do (
  set /a grains*=2
)

echo !grains!

exit /b 0

:invalid_input
echo square must be between 1 and 31
exit /b 1

echo %grains%

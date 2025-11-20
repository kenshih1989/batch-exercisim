@echo off
setlocal enabledelayedexpansion

set "N=%~1"
set "difference="
Set /a sum=0
Set /a sum2=0

REM Calculate the sum of N input
for /l %%a in (1,1,%N%) DO (
  Set /a sum+=%%a
)

REM Calculate (sum of N input)^2
set /a sum*=sum

REM Calculate from 1^2 until N^2 and sum up them
for /l %%a in (1,1,%N%) DO (
  Set /a sum2=sum2+%%a*%%a
)

REM Calculate the difference
if %sum% GEQ %sum2% (
  set /a difference=%sum%-%sum2%
  ) else (
  set /a difference=%sum2%-%sum%
)

echo %difference%
exit /b 0

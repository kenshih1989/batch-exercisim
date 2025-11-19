@echo off
setlocal enabledelayedexpansion

set "x=%~1"
set "y=%~2"
set "result="

REM get the sum of x^2+y^2
set /a sum=x*x+y*y

REM calculate the square root of sum
call :square sum radius

REM Determine the result based on the radius value
if %radius% GEQ 10 (
  set "result=0"
  ) else if %radius% GTR 5 (
  set "result=1"
  ) else if %radius% GTR 1 (
  set "result=5"
  ) else (
  set "result=10"
)

echo %result%
exit /b 0

:square
setlocal enabledelayedexpansion
set /a n = !%~1!
::echo %N%
set /a x=n/(11*1024)+40
set /a x=(n/x+x)/2
set /a x=(n/x+x)/2
set /a x=(n/x+x)/2
set /a x=(n/x+x)/2
set /a x=(n/x+x)/2

endlocal & set "%~2=%x%"
exit /b 0;

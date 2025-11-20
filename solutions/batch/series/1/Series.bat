@echo off
setlocal EnableDelayedExpansion

set "series=%~1"
set "sliceLength=%~2"
set "result="

REM Check if sliceLength is zero
if !sliceLength! EQU 0 (
  echo slice length cannot be zero
  exit /b 0
)

REM Check if sliceLength is negative
if !sliceLength! LSS 0 (
  echo slice length cannot be negative
  exit /b 0
)


REM get the length of the series
call :SeriesLength series, length

REM Check if sliceLength is greater than series's length
if %sliceLength% GTR %length% (
  echo slice length cannot be greater than series length
  exit /b 0
)

:Loop
REM display the output
if %length% GEQ %sliceLength% (
  set "result=!result! !series:~0,%sliceLength%!"
  REM Remove the 1st digit of series
  set "series=!series:~1!"
  REM reduce the length by 1
  set /a length-=1
  goto :Loop
)

set "result=!result:~1!"
echo %result%
exit /b 0


:SeriesLength
set "str=!%~1!"
set /a len=0
:SeriesLength_loop
if defined str (
  set "str=!str:~1!"
  set /a len+=1
  goto :SeriesLength_loop
)
set "%~2=%len%"
exit /b 0

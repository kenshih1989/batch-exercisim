@echo off
setlocal enabledelayedexpansion

set "numbers=%1"
set "result="

REM Your code goes here
REM Example 153

REM Validate input
if "%numbers%"=="" (
  echo Error: Please provide a number
  exit /b 1
)

REM Calculate number of digit
set "temp=%numbers%"
set /a digitCount=0
:countDigits
if defined temp (
  set temp=!temp:~1!
  set /a digitCount+=1
  goto :countDigits
)

REM Calculate sum of each digit raised to the power of digitCount
set /a sum=0
set "temp=%numbers%"

:calculateSum
if defined temp (
  REM Get the first digit
  set "digit=!temp:~0,1!"
  
  REM Calculate digit^digitCount
  call :power !digit! !digitCount! result
  
  REM Add to sum
  set /a sum+=!result!
  
  REM Remove the first digit and continue
  set "temp=!temp:~1!"
  goto :calculateSum
)

REM Check if it's an Armstrong number
if !sum! equ %numbers% (
  echo true
  exit /b 0
  ) else (
  echo false
  exit /b 0
)

:power
set /a base=%~1
set /a exponent=%~2
set /a result=1

REM Handle special case: 0^0 = 1 (by convention)
if %base% equ 0 if %exponent% equ 0 (
  set "%~3=1"
  exit /b 0
)

REM Calculate power
set /a counter=0
:powerLoop
if !counter! lss %exponent% (
  set /a result*=base
  set /a counter+=1
  goto :powerLoop
)

set "%~3=!result!"
exit /b 0

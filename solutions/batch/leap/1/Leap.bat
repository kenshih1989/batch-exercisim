@echo off
setlocal enabledelayedexpansion

set "year=%~1"

REM Check leap year logic
REM A leap year (in the Gregorian calendar) occurs:
REM In every year that is evenly divisible by 4.
REM Unless the year is evenly divisible by 100, in which case it's only a leap year if the year is also evenly divisible by 400.

set /A mod4=year%%4
set /A mod100=year%%100
set /A mod400=year%%400

REM Check if a year can be divisible by 4
if !mod4! equ 0 (
  
  REM Check if a year can be divisible by 100
  if !mod100! neq 0 (
    echo 1
    ) else (
    REM Further check if a year can be divisible by 400
    if !mod400! equ 0 (
      echo 1
      ) else (
      echo 0
    )
  )
  
  ) else (
  REM Can't divisible by 4, return 0
  echo 0
)

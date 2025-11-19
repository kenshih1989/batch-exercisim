@echo off
setlocal enabledelayedexpansion

set "row1=%~1"
set "row2=%~2"
set "result="

REM Check for the input
call :checkInput row1
call :checkInput row2

REM Check for the length of the input
set "len1=0"
set "len2=0"

call :strlen_loop row1 len1
call :strlen_loop row2 len2

if !len1! neq !len2! (
  echo left and right strands must be of equal length
  exit /b 1
)

REM Compare each character and increase the counter if mismatch is found
call :compare row1 row2 result

echo %result%
exit /b 0

REM ====================
REM Check input
REM ====================
:checkInput
setlocal enabledelayedexpansion
set "tempInput=!%~1!"
if "!tempInput!"=="" (
  echo Error: Please provide two DNA Strand
  exit /b 1
)
endlocal
exit /b 0

REM ====================
REM Check string length
REM ====================
:strlen_loop
setlocal enabledelayedexpansion
set "temp=!%~1!"
set /a count=0

:loop
if defined temp (
  set "temp=!temp:~1!"
  set /a count+=1
  goto :loop
)
endlocal & set "%~2=%count%"
exit /b 0

REM ====================
REM Compare and get hamming distance
REM ====================
:compare
setlocal enabledelayedexpansion
set /a hammingDistance=0
set "str1=!%~1!"
set "str2=!%~2!"

:compare_Loop
set "chaStr1=!str1:~0,1!"
set "chaStr2=!str2:~0,1!"
if "!chaStr1!" neq "!chaStr2!" (
  set /a hammingDistance+=1
)
set "str1=!str1:~1!"
set "str2=!str2:~1!"
if "!str1!" neq "" (
  goto :compare_Loop
)

endlocal & set "%~3=%hammingDistance%"
exit /b 0

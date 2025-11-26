@echo off
setlocal enabledelayedexpansion

set targetNTH=%~1
set result=

REM a whole number greater than 1 that cannot be exactly divided by any whole number other than itself and 1 (e.g. 2, 3, 5, 7, 11).
set /a index=0
set /a number=1

if !targetNTH! EQU 0 (
  echo there is no zeroth prime
  exit /b 0
)

:next_number
set /a number+=1

call :isprime %number% result
if !result! EQU 1 (
  set /a index+=1
)

@REM echo number: !number!  index: !index!

if !index! LSS !targetNTH! goto next_number
if !index! EQU !targetNTH! echo %number%

exit /b 0

:isprime
set num=%1
if %num% LSS 2 (
  set %2=0
  exit /b
)

rem check divisors only up to sqrt(num)
set /a limit=num
set /a limit/=2

for /l %%d in (2,1,!limit!) do (
  set /a r=num %% %%d
  if !r!==0 (
    set %2=0
    exit /b
  )
)

set %2=1
exit /b

@echo off
setlocal enabledelayedexpansion

set "limit=%~1"
set "result="

REM Your code goes here
set /a number=1

:next_number
set /a number+=1

if !number! LEQ !limit! (
  call :isprime %number% isPrimeNumber
  if !isPrimeNumber! EQU 1 (
    if  "!result!"=="" (
      set "result=!number!"
      goto :next_number
      ) else (
      set "result=!result! !number!"
      goto :next_number
    )
    ) else (
    goto :next_number
  )
)

if defined result (
  echo !result!
)
exit /b 0


:isprime
setlocal enabledelayedexpansion
set num=%1

rem check divisors only up to sqrt(num)
set /a limit=num
set /a limit/=2

for /l %%d in (2,1,!limit!) do (
  set /a r=num %% %%d
  if !r!==0 (
    endlocal & set "%~2=0"
    exit /b 0
  )
)

endlocal & set "%~2=1"

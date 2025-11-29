@echo off
setlocal enabledelayedexpansion

set "hours=%~1"
set "minutes=%~2"

set /a minutesDivisor=60
set /a HoursDivisor=24
set /a hourFromMinutes=0

rem convert minutes to hour
if NOT "!minutes!"=="0" (
  if "!minutes:~0,1!"=="0" set "minutes=!minutes:~1!"
)

set /a hourFromMinutes=!minutes!/!minutesDivisor!

rem get the minutes by mod 24 (remainder after divide by 60)
set /a minutes=!minutes!%%!minutesDivisor!

rem if minutes is negative, add 60 on it and add -1 to hourFromMinutes
if !minutes! LSS 0 (
  set /a minutes+=minutesDivisor
  set /a hourFromMinutes-=1
)

rem get the hour by mod 24 (remainder after divide by 24)
set /a hours=!hours!+!hourFromMinutes!
set /a hours=!hours!%%!HoursDivisor!

rem if hours is negative, keep on add 24 until it greater or equal to 0
:hour_loop
if !hours! LSS 0 (
  set /a hours+=HoursDivisor
  goto :hour_loop
)

Rem check the length of the hours and minutes
call :strlen hours hoursLength
call :strlen minutes minutesLength

Rem append 0 in front of hour and minutes if it's length less than 2
if !hoursLength! LSS 2 set hours=0!hours!
if !minutesLength! LSS 2 set minutes=0!minutes!

echo %hours%:%minutes%

:strlen
setlocal enabledelayedexpansion
set "str=!%~1!"
set /a len=0
:strlen_loop
if defined str (
  set "str=!str:~1!"
  set /a len+=1
  goto :strlen_loop
)
endlocal & set "%~2=%len%"
exit /b 0

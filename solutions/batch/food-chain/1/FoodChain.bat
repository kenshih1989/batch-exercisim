@echo off
setlocal enabledelayedexpansion

set "counter=1"
set startVerse=%~1
set endVerse=%~2
set "result="

REM Your code goes here
for /f "usebackq delims=" %%a in ("lyrics.txt") do (
  set "line=%%a"
  
  REM Add line to current verse (without extra space at the end)
  if !counter!==1 (
    if defined verse1 (
      set "verse1=!verse1!\n%%a"
      ) else (
      set "verse1=%%a"
    )
  )
  
  if !counter!==2 (
    if defined verse2 (
      set "verse2=!verse2!\n%%a"
      ) else (
      set "verse2=%%a"
    )
  )
  
  if !counter!==3 (
    if defined verse3 (
      set "verse3=!verse3!\n%%a"
      ) else (
      set "verse3=%%a"
    )
  )
  
  if !counter!==4 (
    if defined verse4 (
      set "verse4=!verse4!\n%%a"
      ) else (
      set "verse4=%%a"
    )
  )
  
  if !counter!==5 (
    if defined verse5 (
      set "verse5=!verse5!\n%%a"
      ) else (
      set "verse5=%%a"
    )
  )
  
  if !counter!==6 (
    if defined verse6 (
      set "verse6=!verse6!\n%%a"
      ) else (
      set "verse6=%%a"
    )
  )
  
  if !counter!==7 (
    if defined verse7 (
      set "verse7=!verse7!\n%%a"
      ) else (
      set "verse7=%%a"
    )
  )
  
  if !counter!==8 (
    if defined verse8 (
      set "verse8=!verse8!\n%%a"
      ) else (
      set "verse8=%%a"
    )
  )
  
  REM Check if line contains "die"
  echo %%a | find /i "die" >nul
  if !errorlevel!==0 (
    set /a counter+=1
  )
)

REM forming the result
for /l %%d in (!startVerse!,1,!endVerse!) do (
  call set "temp=%%verse%%d%%"
  if defined result (
    set "result=!result!\n!temp!"
    ) else (
    set "result=!temp!"
  )
)

echo !result!

endlocal

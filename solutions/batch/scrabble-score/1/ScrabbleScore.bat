@echo off
setlocal enabledelayedexpansion

set "word=%~1"
set "result="

REM Show 0 score if word is empty
if not defined word (
  echo 0
  exit /b 0
)

:Loop
if "!word!"=="" (
  echo %result%
  exit /b 0
)

set "firstCharacter=!word:~0,1!"
REM Convert to uppercase and append to acronym
call :ToUpper !firstCharacter! upper
call :GetScore !upper! score
set /a result+=score
set "word=!word:~1!"
GOTO :Loop

REM Subroutine to convert character to uppercase
:ToUpper
set "char=%~1"
for %%a in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
  call set "char=%%char:%%a=%%a%%"
)
set "%~2=%char%"
exit /b 0

REM Subroutine to calculate score
:GetScore
set "char=%~1"
if /i "%char%"=="A" set "score=1"
if /i "%char%"=="B" set "score=3"
if /i "%char%"=="C" set "score=3"
if /i "%char%"=="D" set "score=2"
if /i "%char%"=="E" set "score=1"
if /i "%char%"=="F" set "score=4"
if /i "%char%"=="G" set "score=2"
if /i "%char%"=="H" set "score=4"
if /i "%char%"=="I" set "score=1"
if /i "%char%"=="J" set "score=8"
if /i "%char%"=="K" set "score=5"
if /i "%char%"=="L" set "score=1"
if /i "%char%"=="M" set "score=3"
if /i "%char%"=="N" set "score=1"
if /i "%char%"=="O" set "score=1"
if /i "%char%"=="P" set "score=3"
if /i "%char%"=="Q" set "score=10"
if /i "%char%"=="R" set "score=1"
if /i "%char%"=="S" set "score=1"
if /i "%char%"=="T" set "score=1"
if /i "%char%"=="U" set "score=1"
if /i "%char%"=="V" set "score=4"
if /i "%char%"=="W" set "score=4"
if /i "%char%"=="X" set "score=8"
if /i "%char%"=="Y" set "score=4"
if /i "%char%"=="Z" set "score=10"
set "%~2=%score%"
exit /b 0

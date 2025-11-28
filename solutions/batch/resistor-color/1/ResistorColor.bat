@echo off
setlocal enabledelayedexpansion

set colorCode=%~1
set "result="
set "found=0"

REM Your code goes here
set "availableColor=black\nbrown\nred\norange\nyellow\ngreen\nblue\nviolet\ngray\nwhite"
if "%1" =="" (
  set "result=!availableColor!"
  goto end_switch
  ) else (
  set availableColor=%availableColor:\n= %
  for %%a in (!availableColor!) do (
    if "!colorCode!"=="%%a" set "found=1"
  )
)

if "!found!"=="0" (
  set "result=Color not found: !colorCode!"
  goto end_switch
  ) else (
  goto switch_case_%colorCode%
)

:switch_case_black
set /a result=0
goto end_switch

:switch_case_brown
set /a result=1
goto end_switch

:switch_case_red
set /a result=2
goto end_switch

:switch_case_orange
set /a result=3
goto end_switch

:switch_case_yellow
set /a result=4
goto end_switch

:switch_case_green
set /a result=5
goto end_switch

:switch_case_blue
set /a result=6
goto end_switch

:switch_case_violet
set /a result=7
goto end_switch

:switch_case_grey
set /a result=8
goto end_switch

:switch_case_white
set /a result=9
goto end_switch

:end_switch
echo %result%

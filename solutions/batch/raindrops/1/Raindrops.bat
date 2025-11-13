@echo off
SETLOCAL EnableDelayedExpansion

set "input=%~1"
set "result="

REM Your code goes here
set /a mod3 = input%%3
set /a mod5 = input%%5
set /a mod7 = input%%7

REM Set Pling if the input given is divisible by 3
if !mod3! equ 0 (
  set "result=Pling"
)

REM Set Plang if the input given is divisible by 5
if !mod5! equ 0 (
  set "result=!result!Plang"
)

REM Set Plong if the input given is divisible by 7
if !mod7! equ 0 (
  set "result=!result!Plong"
)

REM return the input as result if input can't be divisible with 3,5,7
if %mod3% neq 0 if %mod5% neq 0 if %mod7% neq 0 (
  set "result=!input!"
)

echo !result!

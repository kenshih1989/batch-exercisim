@echo off
setlocal EnableDelayedExpansion

set "input=%~1"
set "result="

REM Using the square root formula from Dart exercise
REM The formula will calculate the nearest square root number
set "Sqrt(N)=( x=(N)/(11*1024)+40, x=((N)/x+x)/2, x=((N)/x+x)/2, x=((N)/x+x)/2, x=((N)/x+x)/2, x=((N)/x+x)/2 )"

set /a "result=!sqrt(n):n=%input%!"

echo %result%

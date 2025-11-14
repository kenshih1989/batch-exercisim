@echo off
SETLOCAL EnableDelayedExpansion

set "nucleotide=%~1"
set "nucleotide[A]=0"
set "nucleotide[C]=0"
set "nucleotide[G]=0"
set "nucleotide[T]=0"

REM Your code goes here
:strlen_loop
if defined nucleotide (
  
  REM Get the 1st character of the string
  set "cha=%nucleotide:~0,1%"
  
  REM Check if valid character
  if "!cha!"=="G" goto :valid
  if "!cha!"=="A" goto :valid
  if "!cha!"=="C" goto :valid
  if "!cha!"=="T" goto :valid
  
  REM Invalid character found
  echo Invalid nucleotide in strand
  exit /b 1
  
  :valid
  set /A nucleotide[!cha!]+=1
  set "nucleotide=!nucleotide:~1!"
  goto :strlen_loop
)

echo !nucleotide[A]!,!nucleotide[C]!,!nucleotide[G]!,!nucleotide[T]!
exit /b 0

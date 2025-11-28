@echo off
setlocal enabledelayedexpansion

set "inputs="
set "result="
set "firstWord="
set /a index=0

set "inputs=%~1"


REM Forming array-like structure
REM get the 1st word for last sentence
set "firstWord=%~1"

:forming_array
if "%1"=="" goto generate_sentence
set "words[!index!]=%~1"
set /a index+=1
shift
goto forming_array


:generate_sentence
REM if there was no word (empty inputs passed in), display the result
set /a index-=1
if !index! LSS 0 goto display_result

REM if only 1 word, generate the last sentence.
if !index! EQU 0 goto last_sentence

REM Loop through each word
for /L %%i in (0,1,%index%) do (
  set /a nextIndex=%%i+1
  
  if !nextIndex! GTR !index! (
    goto last_sentence
    ) else (
    for %%n in (!nextIndex!) do (
      set "result=!result!For want of a !words[%%i]! the !words[%%n]! was lost.\n"
    )
  )
)

:last_sentence
set "result=!result!And all for the want of a !firstWord!."
@REM echo And all for the want of a !firstWord!.
goto display_result

:display_result
if defined result (
  echo !result!
)
exit /b 0

@echo off
SETLOCAL EnableDelayedExpansion

set "phrase=%~1"
set "acronym="

REM Replace hyphens and underscores with spaces
set "phrase=!phrase:-= !"
set "phrase=!phrase:_= !"

REM Loop through each word and get first character
for %%w in (!phrase!) do (
  set "word=%%w"
  set "first=!word:~0,1!"
  
  REM Convert to uppercase and append to acronym
  call :ToUpper !first! upper
  set "acronym=!acronym!!upper!"
)

echo !acronym!
exit /b 0

REM Subroutine to convert character to uppercase
:ToUpper
set "char=%~1"
for %%a in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
  call set "char=%%char:%%a=%%a%%"
)
for %%a in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do (
  call set "char=%%char:%%a=%%a%%"
)

REM Manual conversion (more reliable)
if /i "%char%"=="a" set "char=A"
if /i "%char%"=="b" set "char=B"
if /i "%char%"=="c" set "char=C"
if /i "%char%"=="d" set "char=D"
if /i "%char%"=="e" set "char=E"
if /i "%char%"=="f" set "char=F"
if /i "%char%"=="g" set "char=G"
if /i "%char%"=="h" set "char=H"
if /i "%char%"=="i" set "char=I"
if /i "%char%"=="j" set "char=J"
if /i "%char%"=="k" set "char=K"
if /i "%char%"=="l" set "char=L"
if /i "%char%"=="m" set "char=M"
if /i "%char%"=="n" set "char=N"
if /i "%char%"=="o" set "char=O"
if /i "%char%"=="p" set "char=P"
if /i "%char%"=="q" set "char=Q"
if /i "%char%"=="r" set "char=R"
if /i "%char%"=="s" set "char=S"
if /i "%char%"=="t" set "char=T"
if /i "%char%"=="u" set "char=U"
if /i "%char%"=="v" set "char=V"
if /i "%char%"=="w" set "char=W"
if /i "%char%"=="x" set "char=X"
if /i "%char%"=="y" set "char=Y"
if /i "%char%"=="z" set "char=Z"

set "%~2=%char%"
exit /b 0

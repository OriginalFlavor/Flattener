@echo off
cd "%~1"
md tempryfolder
move *.* tempryfolder
for /r %%f in ("*.*") do call :START "%%~f"
for /r /d %%f in (*.*) do rd "%%~f" 
GOTO :EOF
:START
setlocal
If exist "%~n1%~x1" set /a num=2
:LOOP
If exist "%~n1%num%%~x1" (
    set /a num+=1
    goto loop
)
move "%~1" "%~n1%num%%~x1"
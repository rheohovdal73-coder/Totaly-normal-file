:: Note This batch script doesn't do any real harm and it can be closed easily

@echo off
title Windows.file.registry.files.cmd.error.5%7%$6c6#gdg6&dg6&
cls

:: --- PROCESS ROUTING ---
if "%~1"=="-popup" goto :popup_loop
if "%~1"=="-child" goto :spam_loop

:: --- MAIN INITIAL LAUNCH ---
:: Clear any leftover stop signals from previous runs
del "%temp%\stop_troll.tmp" >nul 2>&1


echo.
echo Failed failded
echo.
echo Error Error Error
echo.

:: Launch 15 spam windows and 15 popup loops
for /l %%i in (1,1,20) do (
    start "" /min "%~f0" -popup
    start "" "%~f0" -child
)

:: Wait right here for the user to press Enter
pause >nul

:: Create the stop signal file that all other windows are watching for
echo stop > "%temp%\stop_troll.tmp"

:: Brief pause to let children close, then clean up the file
timeout /t 1 >nul
del "%temp%\stop_troll.tmp" >nul 2>&1
cls
color 07
echo [+] All troll windows and popups successfully terminated.
echo.
pause
exit


:: --- COLOR & TEXT SPAM WINDOWS ---
:spam_loop
title System Failure Replica
set /a "bg=%random% %% 16"
set /a "fg=%random% %% 16"
set "hex=0123456789ABCDEF"
call set "bg_hex=%%hex:~%bg%,1%%"
call set "fg_hex=%%hex:~%fg%,1%%"
if "%bg_hex%"=="%fg_hex%" goto spam_loop
color %bg_hex%%fg_hex%

set /a "msg_index=%random% %% 4"
if %msg_index%==0 echo [CRITICAL] Memory leak detected at address 0x7FFF00A2
if %msg_index%==1 echo [FATAL ERROR] Corrupted master file table index!
if %msg_index%==2 echo [WARNING] Overclock failure. Dumping volatile VRAM...
if %msg_index%==3 echo [ALERT] Unhandled exception in ring 0 kernel space.

:: Check if the master window signaled a stop
if exist "%temp%\stop_troll.tmp" exit
goto spam_loop


:: --- VISUAL ERROR POPUPS ---
:popup_loop
:: Generate a simple VBScript background popup box
set "vbs_file=%temp%\troll_msg_%random%.vbs"
echo MsgBox "A critical system error has occurred. Please restart your software.", 16, "Windows System Alert" > "%vbs_file%"

:: Run the popup window
cscript //nologo "%vbs_file%" >nul 2>&1

:: Clean up the micro-vbs file immediately
del "%vbs_file%" >nul 2>&1

:: If master hasn't stopped, loop to generate another popup box
if exist "%temp%\stop_troll.tmp" exit
goto popup_loop


@ECHO OFF
COLOR 0F && CLS
TITLE WMC v%Year%

:: Get current year using PowerShell (modern systems)
FOR /F %%i IN ('powershell -NoProfile -Command "Get-Date -Format yyyy"') DO SET Year=%%i

:: Check if script launched with InstallGreen argument for UAC re-run
if /I "%1"=="InstallGreen" goto InstallGreen

:SELECT
CLS
ECHO ----------------------------------------------------------------
ECHO                W.M.C. - Windows Media Center %Year%
ECHO ----------------------------------------------------------------
ECHO.
ECHO                 Windows Media Center (WMC) can
ECHO                   aid you in playing slideshows,
ECHO                    videos, music, and more
ECHO                     from numerous sources
ECHO                       on the Windows OS.
ECHO.
ECHO -----------------------------------------------------------------
ECHO    Please make sure that you are connected to the Internet.
ECHO     Looking for older instances of Office in the Control Panel
ECHO               If found, the install will fail.
ECHO -----------------------------------------------------------------
ECHO    Copyright (c) %Year% Stephan Pringle. All rights reserved.
ECHO -----------------------------------------------------------------
ECHO.
ECHO  Install:
ECHO  1. Windows Media Center (Black)
ECHO  2. Windows Media Center (Blue)
ECHO  3. Windows Media Center (Green)
ECHO  4. Windows Media Center (Grey)
ECHO  5. Windows Media Center (Red)
ECHO  6. Windows Media Center (Yellow)
ECHO.
ECHO  7. Uninstall Windows Media Center
ECHO  0. Quit
ECHO.

:: Prompt user
SET /P ChoosedLanguage=Enter a number and press ENTER key or 0 to quit: 

:: Validate numeric input
SETLOCAL ENABLEDELAYEDEXPANSION
SET /A Dummy=%ChoosedLanguage% >NUL 2>&1
IF ERRORLEVEL 1 (
    ENDLOCAL
    ECHO Invalid selection. Please enter a valid number.
    TIMEOUT /T 2 >NUL
    GOTO SELECT
)
ENDLOCAL

:: Routing logic
IF "%ChoosedLanguage%"=="0" GOTO E
IF %ChoosedLanguage% GEQ 1 IF %ChoosedLanguage% LEQ 6 GOTO %ChoosedLanguage%

:: Catch invalid values
ECHO Invalid selection. Please enter a valid option.
TIMEOUT /T 2 >NUL
GOTO SELECT

:: Installer Labels
:1
ECHO Installing WMC with the Black theme...
CALL InstallerBLACK
GOTO DONE

:2
ECHO Installing WMC with the Blue theme...
CALL InstallerBLUE
GOTO DONE

:3
ECHO Installing WMC with the Green theme...
CALL :InstallGreen
GOTO DONE

:4
ECHO Installing WMC with the Grey theme...
CALL InstallerGREY
GOTO DONE

:5
ECHO Installing WMC with the Red theme...
CALL InstallerRED
GOTO DONE

:6
ECHO Installing WMC with the Yellow theme...
CALL InstallerYELLOW
GOTO DONE

:DONE
ECHO.
ECHO Returning to main menu...
TIMEOUT /T 2 >NUL
GOTO SELECT

:E
ECHO Exiting WMC installer...
TIMEOUT /T 1 >NUL
EXIT

:: --- Green Installer Embedded Logic ---
:InstallGreen
@echo off

:: Check for admin rights
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if "%errorlevel%" NEQ "0" (
    echo: Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo: UAC.ShellExecute "%~s0", "InstallGreen", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del /f /q "%temp%\getadmin.vbs"
    exit /b
)

:: Check for 64-bit system
%windir%\system32\reg.exe query "HKLM\System\CurrentControlSet\Control\Session Manager\Environment" /v PROCESSOR_ARCHITECTURE | find /i "amd64" >nul || (
    echo ============================================================
    echo ERROR: This pack is for 64-bit systems.
    echo ============================================================
    echo.
    pause
    exit /b
)

:: Check if Media Center already installed
if exist "%windir%\ehome\ehshell.exe" (
    echo ============================================================
    echo ERROR: MediaCenter pack is already installed.
    echo ============================================================
    echo.
    pause
    exit /b
)

:: Set console buffer size (optional)
%windir%\System32\reg.exe add HKU\.DEFAULT\Console\^%%SystemRoot^%%_system32_cmd.exe /v ScreenBufferSize /t REG_DWORD /d 19660880 /f >nul 2>&1

:: Run InstallGREEN.bat with NSudoC for elevated privileges
bin\NSudoC.exe -U:T -P:E "\"\"%~dp0bin\Installgreen.bat\"\""

goto :eof

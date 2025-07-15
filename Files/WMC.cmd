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
ECHO    Copyright (c) %Year% Stephan Pringle. All rights reserved.
ECHO -----------------------------------------------------------------
ECHO.
ECHO  Install:
ECHO  1. Windows Media Center (Black)
ECHO  2. Windows Media Center (Blue)
ECHO  3. Windows Media Center (Green)
ECHO.
ECHO  Uninstall:
ECHO  4. Uninstal Windows Media Center (All)
ECHO.
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
CALL InstallerBLACK.cmd
GOTO DONE

:2
ECHO Installing WMC with the Blue theme...
CALL InstallerBLUE.cmd
GOTO DONE

:3
ECHO Installing WMC with the Green theme...
CALL InstallerGREEN.cmd
GOTO DONE

:4
ECHO Uninstalling WMC...
CALL Uninstaller.cmd
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

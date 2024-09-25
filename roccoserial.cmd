@echo off
title Rocco1337 - HWID
color 0B

:menu
cls
echo ===========================================================
echo            ROCCO SERIAL CHECKER 
echo                 			By Rocco1337 
echo ===========================================================
echo.
echo Please select an option:
echo 1. Baseboard Information
echo 2. BIOS Information
echo 3. CPU Information
echo 4. Disk Drive Information
echo 5. All Information
echo 6. Save All Information to text file
echo 7. Exit
echo.
set /p option=Enter your choice (1-7):

if "%option%"=="1" goto baseboard
if "%option%"=="2" goto bios
if "%option%"=="3" goto cpu
if "%option%"=="4" goto diskdrive
if "%option%"=="5" goto all
if "%option%"=="6" goto savefile
if "%option%"=="7" exit

:: Invalid input handling
echo Invalid choice, please try again.
pause
goto menu

:baseboard
cls
echo ---- Baseboard Information ----
echo Baseboard Serial Number:
wmic baseboard get serialnumber | findstr /r /v "^$"
echo Baseboard Manufacturer:
wmic baseboard get manufacturer | findstr /r /v "^$"
wmic path Win32_NetworkAdapter where "PNPDeviceID like '%%PCI%%' AND NetConnectionStatus=2 AND AdapterTypeID='0'" get MacAddress
echo ------------------------------
echo.
echo Press any key to repeat.
pause >nul
goto menu

:bios
cls
echo -------- BIOS Information --------
echo BIOS Serial Number:
wmic bios get serialnumber | findstr /r /v "^$"
echo BIOS Version:
wmic bios get smbiosbiosversion | findstr /r /v "^$"
echo ------------------------------
echo.
echo Press any key to repeat.
pause >nul
goto menu

:cpu
cls
echo -------- CPU Information --------
echo CPU Serial Number:
wmic cpu get serialnumber | findstr /r /v "^$"
echo CPU Name:
wmic cpu get name | findstr /r /v "^$"
wmic memorychip get serialnumber
echo ------------------------------
echo.
echo Press any key to repeat.
pause >nul
goto menu

:diskdrive
cls
echo ---- Disk Drive Information ----
echo Disk Drive Serial Number:
wmic diskdrive get serialnumber | findstr /r /v "^$"
echo Disk Drive Model:
wmic diskdrive get model | findstr /r /v "^$"
echo ------------------------------
echo.
echo Press any key to repeat.
pause >nul
goto menu

:all
cls
echo ---- Baseboard Information ----
echo Baseboard Serial Number:
wmic baseboard get serialnumber | findstr /r /v "^$"
echo Baseboard Manufacturer:
wmic baseboard get manufacturer | findstr /r /v "^$"
echo ------------------------------
echo.
echo -------- BIOS Information --------
echo BIOS Serial Number:
wmic bios get serialnumber | findstr /r /v "^$"
echo BIOS Version:
wmic bios get smbiosbiosversion | findstr /r /v "^$"
echo ------------------------------
echo.
echo -------- CPU Information --------
echo CPU Serial Number:
wmic cpu get serialnumber | findstr /r /v "^$"
echo CPU Name:
wmic cpu get name | findstr /r /v "^$"
echo ------------------------------
echo.
echo ---- Disk Drive Information ----
echo Disk Drive Serial Number:
wmic diskdrive get serialnumber | findstr /r /v "^$"
echo Disk Drive Model:
wmic diskdrive get model | findstr /r /v "^$"
echo ------------------------------
echo.
echo Press any key to repeat.
pause >nul
goto menu

:savefile
cls
echo Saving to roccoserial.txt.

(
    echo ROCCO HWID 
    echo By Rocco1337
    echo ----------------------------------------------------
    echo Date and Time of Check: %date% %time%
    echo ----------------------------------------------------
    echo.

    echo ---- Baseboard Information ----
    wmic baseboard get serialnumber | findstr /r /v "^$"
    wmic baseboard get manufacturer | findstr /r /v "^$"
    echo ------------------------------
    echo.

    echo -------- BIOS Information --------
    wmic bios get serialnumber | findstr /r /v "^$"
    wmic bios get smbiosbiosversion | findstr /r /v "^$"
    echo ------------------------------
    echo.

    echo -------- CPU Information --------
    wmic cpu get serialnumber | findstr /r /v "^$"
    wmic cpu get name | findstr /r /v "^$"
    echo ------------------------------
    echo.

    echo ---- Disk Drive Information ----
    wmic diskdrive get serialnumber | findstr /r /v "^$"
    wmic diskdrive get model | findstr /r /v "^$"
    echo ------------------------------
) > roccoserial.txt

echo Saved to roccoserial.txt
echo Press any key to restart.
pause >nul
goto menu

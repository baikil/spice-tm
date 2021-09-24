@echo off
:logo
::https://patorjk.com/software/taag/#p=display&f=Slant&t=Spice%20-%20tm::
set "logo1=echo [38;5;255m   _____       _                     [38;5;202m  __          [0m"
set "logo2=echo [38;5;255m  / ___/____  (_)_______             [38;5;202m / /_____ ___ [0m"
set "logo3=echo [38;5;255m  \__ \/ __ \/ / ___/ _ \   ______   [38;5;202m/ __/ __ `__ \[0m"
set "logo4=echo [38;5;255m ___/ / /_/ / / /__/  __/  /_____/  [38;5;202m/ /_/ / / / / /[0m"
set "logo5=echo [38;5;255m/____/ .___/_/\___/\___/            [38;5;202m\__/_/ /_/ /_/ [0m"
set "logo6=echo [38;5;255m    /_/                 [38;5;240mSpicetify theme manager v1[0m"
set "logo=cls&%logo1%&%logo2%&%logo3%&%logo4%&%logo5%&%logo6%"
:menu
MODE 130, 24
title Spice-tm installer - Menu
%logo%
echo.
echo.
echo 1. Install
echo 2. About
echo 3. Exit
echo.
choice /c 123 /n
if %errorlevel% == 1 goto install
if %errorlevel% == 2 goto about
if %errorlevel% == 3 goto exit
:install
MODE 130, 24
title Spice-tm installer - Installing... [0%]
%logo%
echo.
echo.
echo Preparing
echo [38;5;9m0%%[0m
md %public%\spice-tm
title Spice-tm installer - Installing... [33%]
%logo%
echo.
echo.
echo Downloading
echo [38;5;208m33%%[0m
powershell.exe -command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/baikil/spice-tm/main/spice-tm.bat','%public%\animetake\spice-tm.bat')"
powershell.exe -command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/baikil/animetake/main/spice-tm.ico','%public%\animetake\spice-tm.ico')"
title Spice-tm installer - Installing... [66%]
%logo%
echo.
echo.
echo                                                        ษอออออออออออออป
echo                                                        บ Finalising  บ
echo                                                        บ     [38;5;220m66%%[0m     บ 
echo                                                        ศอออออออออออออผ
set shortcutmaker="%temp%\shortcutmaker_%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %shortcutmaker%
echo sLinkFile = "%USERPROFILE%\Desktop\Animetake.lnk" >> %shortcutmaker%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %shortcutmaker%
echo oLink.TargetPath = "%public%\animetake\Animetake.bat" >> %shortcutmaker%
echo oLink.Description = "Unofficial animetake client" >> %shortcutmaker%
echo oLink.IconLocation = "%public%\animetake\animetake.ico" >> %shortcutmaker%
echo oLink.Save >> %shortcutmaker%
cscript /nologo %shortcutmaker%
del %shortcutmaker%
title Spice-tm installer - Installed [100%]
%logo%
echo.
echo.
echo                                                        ษอออออออออออออป
echo                                                        บ  Installed  บ
echo                                                        บ    [38;5;10m100%%[0m     บ 
echo                                                        ศอออออออออออออผ
timeout /t 2 >nul
set startapp=true
goto exit
:about
title Spice-tm installer - About
%logo%
echo.
echo.
echo                                                        ษออออออออออออป
echo                                                        บ   ABOUT    บ
echo                                                        ศออออออออออออผ
echo.
echo                                                  Description : Spicetify theme manager
echo                                                      Version : 1
echo                                                File location : %0
echo                                                      Made by : Baikil
echo                                                       Github : https://github.com/baikil/spice-tm
echo.
echo.
echo.
echo                                           ^< Press any key to go back to the menu ^>
pause >nul
goto menu
:exit
MODE 130, 24
title Spice-tm installer - Exit
cls
%logo1%
%logo2%
%logo3%
%logo4%
%logo5%
%logo6%
echo.
echo.
echo                                                        ษอออออออออออออป
echo                                                        บ   Goodbye   บ
echo                                                        ศอออออออออออออผ
echo.
timeout /t 2 >nul
if "%startapp%" == "true" (start %public%\animetake\Animetake.bat)
exit
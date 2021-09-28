:::::::::::::::::::::::::::
::Spicetify theme manager::
::Made by Baikil         ::
::v1.2                   ::
:::::::::::::::::::::::::::

:menu
call :ini
title Spice-tm // Menu
%logo%
echo.
echo [38;5;202m//[0mAvailable themes[38;5;202m//[0m
echo.
echo 1. BurntSienna
echo 2. Default
echo 3. Dreary
echo 4. Dribbblish
echo 5. Fluent
echo 6. Onepunch
echo 7. Sleek
echo 8. Turntable
echo 9. Ziro
choice /c 123456789 /n
goto theme%errorlevel%
exit

:::::::::::::::::::::::::::
::Theme variants selector::
:::::::::::::::::::::::::::
:theme1
title Spice-tm // BurntSienna
%logo%
echo.
echo [38;5;202m//[0mWarning[38;5;202m//[0m
echo.
echo This theme use the Monsterrat font
echo Please install it from here :
echo.
echo https://fonts.google.com/download?family=Montserrat
timeout /t 5 >nul
call :BurntSienna
goto menu

:theme2
title Spice-tm // Default
call :Default
goto menu
:theme3
title Spice-tm // 
%logo%
echo.
echo [38;5;202m//[0mAvailable color schemes[38;5;202m//[0m
echo.
echo 1. 
echo 2. 
echo 3. 
echo 4. 
echo 5. 
echo 6. 
echo 7. 
echo 8. 
echo 9. 
choice /c 123456789 /n
if %errorlevel% == 1 call : 
if %errorlevel% == 2 call : 
if %errorlevel% == 3 call : 
if %errorlevel% == 4 call : 
if %errorlevel% == 5 call : 
if %errorlevel% == 6 call : 
if %errorlevel% == 7 call : 
if %errorlevel% == 8 call : 
if %errorlevel% == 9 call : 
goto menu
:theme4
title Spice-tm // Dribbblish
%logo%
echo.
echo [38;5;202m//[0mAvailable color schemes[38;5;202m//[0m
echo.
echo 1. base
echo 2. beach-sunset
echo 3. dark
echo 4. gruvbox
echo 5. nord-dark
echo 6. nord-light
echo 7. purple
echo 8. samourai
echo 9. white
choice /c 123456789 /n
if %errorlevel% == 1 call :Dribbblish base
if %errorlevel% == 2 call :Dribbblish beach-sunset
if %errorlevel% == 3 call :Dribbblish dark
if %errorlevel% == 4 call :Dribbblish gruvbox
if %errorlevel% == 5 call :Dribbblish nord-dark
if %errorlevel% == 6 call :Dribbblish nord-light
if %errorlevel% == 7 call :Dribbblish purple
if %errorlevel% == 8 call :Dribbblish samourai
if %errorlevel% == 9 call :Dribbblish white
goto menu

:::::::::::::::::::::::::
::Apply theme fucntions::
:::::::::::::::::::::::::
:BurntSienna
spicetify config current_theme BurntSienna
spicetify config color_scheme base
spicetify apply
exit /b
:Default
spicetify config current_theme Default
spicetify config color_scheme base
spicetify apply
exit /b
:Dribbblish [ <base> <beach-sunset> <dark> <gruvbox> <nord-dark> <nord-light> <purple> <samourai> <white> ]
title Spice-tm // Dribbblish %1
copy /b /y "%userprofile%\.spicetify\Themes\Dribbblish\dribbblish.js" "%userprofile%\.spicetify\Extensions\dribbblish.js"
spicetify restore
spicetify config extensions dribbblish.js
spicetify config current_theme Dribbblish
spicetify config color_scheme %1
spicetify apply
exit /b

::::::::::::::::::::
::Custom functions::
::::::::::::::::::::
:ini
@echo off
set "_cd=%cd%"
if not exist %public%\spice-tm\ (md %public%\spice-tm)
if not exist %public%\spice-tm\settings.txt (call :makeset)
call :loadset
call :logo
exit /b
:loadset
cd %public%\spice-tm
for /f "delims== tokens=1,2" %%G in (settings.txt) do set "%%G=%%H"
exit /b
:makeset
cd %public%\spice-tm
echo theme=Default>settings.txt
exit /b
:editset
cd %public%\spice-tm
echo theme=%theme%>settings.txt
exit /b
:logo
::https://patorjk.com/software/taag/#p=display&f=Slant&t=Spice%20-%20tm::
set "logo1=echo [38;5;255m   _____       _                     [38;5;202m  __          [0m"
set "logo2=echo [38;5;255m  / ___/____  (_)_______             [38;5;202m / /_____ ___ [0m"
set "logo3=echo [38;5;255m  \__ \/ __ \/ / ___/ _ \   ______   [38;5;202m/ __/ __ `__ \[0m"
set "logo4=echo [38;5;255m ___/ / /_/ / / /__/  __/  /_____/  [38;5;202m/ /_/ / / / / /[0m"
set "logo5=echo [38;5;255m/____/ .___/_/\___/\___/            [38;5;202m\__/_/ /_/ /_/ [0m"
set "logo6=echo [38;5;255m    /_/                 [38;5;240mSpicetify theme manager v1.2[0m"
set "logo=cls&%logo1%&%logo2%&%logo3%&%logo4%&%logo5%&%logo6%"
exit /b
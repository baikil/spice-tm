:::::::::::::::::::::::::::
::Spicetify theme manager::
::Made by Baikil         ::
::v1                     ::
:::::::::::::::::::::::::::

call :ini
%logo%
echo.
call :themeslist
choice /c 123456789 /n
cd %_cd%
call linereader %errorlevel%
pause
exit



:::::::::::::::::::::::::
::Apply theme fucntions::
:::::::::::::::::::::::::
:Dribbblish [ <base> <beach-sunset> <dark> <gruvbox> <nord-dark> <nord-light> <purple> <samourai> <white> ]
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
:themeslist
cd C:\Users\Raf\.spicetify\Themes
dir /a:d /b > %public%\spice-tm\themes.txt
set file=%public%\spice-tm\themes.txt
set x=1
setlocal EnableDelayedExpansion
echo Avalable themes :>%public%\spice-tm\themes.tmp
for /f "delims=|" %%i in (%public%\spice-tm\themes.txt) do (echo !x!. %%i>>%public%\spice-tm\themes.tmp&set /a x=!x!+1)
copy /b /y "%public%\spice-tm\themes.tmp" "%public%\spice-tm\themeslist.txt">nul
del %public%\spice-tm\themes.tmp
type %public%\spice-tm\themeslist.txt
setlocal DisableDelayedExpansion
exit /b
:next
setlocal DisableDelayedExpansion&exit /b
:logo
::https://patorjk.com/software/taag/#p=display&f=Slant&t=Spice%20-%20tm::
set "logo1=echo [38;5;255m   _____       _                     [38;5;47m  __          [0m"
set "logo2=echo [38;5;255m  / ___/____  (_)_______             [38;5;47m / /_____ ___ [0m"
set "logo3=echo [38;5;255m  \__ \/ __ \/ / ___/ _ \   ______   [38;5;47m/ __/ __ `__ \[0m"
set "logo4=echo [38;5;255m ___/ / /_/ / / /__/  __/  /_____/  [38;5;47m/ /_/ / / / / /[0m"
set "logo5=echo [38;5;255m/____/ .___/_/\___/\___/            [38;5;47m\__/_/ /_/ /_/ [0m"
set "logo6=echo [38;5;255m    /_/                 [38;5;240mSpicetify theme manager v1[0m"
set "logo=cls&%logo1%&%logo2%&%logo3%&%logo4%&%logo5%&%logo6%"
exit /b
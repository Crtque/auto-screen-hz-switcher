@echo off
setlocal

echo Disabling tasks...

schtasks /delete /tn "Screen Refresh Rate Hack Ac On" /f
schtasks /delete /tn "Screen Refresh Rate Hack Ac Off" /f

:: Путь к ярлыку
set "STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "SHORTCUT=%STARTUP_FOLDER%\ScreenRefreshCheck.lnk"

:: Проверка наличия файла и удаление
if exist "%SHORTCUT%" (
    del "%SHORTCUT%"
    echo Autorun task is disabled: %SHORTCUT%
) else (
    echo Autorun task not found: %SHORTCUT%
)

echo Tasks are deleted
pause

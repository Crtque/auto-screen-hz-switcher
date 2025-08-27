@echo off
setlocal

:: Получаем путь к текущей папке
set "TASK_DIR=%~dp0"
set "TASK_DIR=%TASK_DIR:~0,-1%"

:: ==== Создание XML с параметром AcOnline=true (для 144 Гц) ====
set "XML_TRUE=%TEMP%\task_ac_online_true.xml"
copy "%TASK_DIR%\task_template.xml" "%XML_TRUE%" >nul
powershell -Command "(Get-Content '%XML_TRUE%') -replace '__EXEPATH__', '%TASK_DIR%' -replace '__ACSTATUS__', 'true' -replace '__HERZ__', '144' | Set-Content '%XML_TRUE%'"
schtasks /create /tn "Screen Refresh Rate Hack Ac On" /xml "%XML_TRUE%" /f

:: ==== Создание XML с параметром AcOnline=false (для 60 Гц) ====
set "XML_FALSE=%TEMP%\task_ac_online_false.xml"
copy "%TASK_DIR%\task_template.xml" "%XML_FALSE%" >nul
powershell -Command "(Get-Content '%XML_FALSE%') -replace '__EXEPATH__', '%TASK_DIR%' -replace '__ACSTATUS__', 'false' -replace '__HERZ__', '60' | Set-Content '%XML_FALSE%'"
schtasks /create /tn "Screen Refresh Rate Hack Ac Off" /xml "%XML_FALSE%" /f

:: Удаляем временные файлы
del "%XML_TRUE%" >nul
del "%XML_FALSE%" >nul

:: Проверяем состояние питания при запуске ПК
set "CURRENT_DIR=%~dp0"
set "SCRIPT=%CURRENT_DIR%check_power_and_set_refresh.bat"

:: Путь к автозагрузке
set "STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "SHORTCUT=%STARTUP_FOLDER%\ScreenRefreshCheck.lnk"

:: Создаём ярлык через PowerShell
powershell -NoProfile -Command ^
  "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%SHORTCUT%'); $s.TargetPath = '%SCRIPT%'; $s.WorkingDirectory = '%CURRENT_DIR%'; $s.Save()"

echo Added to autorun: %SHORTCUT%


echo Tasks created successfully
pause

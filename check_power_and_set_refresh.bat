@echo off
setlocal

:: Путь к exe рядом с батником
set "EXE_PATH=%~dp0ScreenResChange.exe"

:: Один вызов PowerShell, всё в одной строке
powershell -NoProfile -ExecutionPolicy Bypass -Command " $bs = Get-CimInstance -Namespace root/wmi -Class BatteryStatus -ErrorAction SilentlyContinue; if ($bs -and $bs.PowerOnline) { Start-Process -FilePath '%EXE_PATH%' -ArgumentList '-hz 144' -WindowStyle Hidden } else { Start-Process -FilePath '%EXE_PATH%' -ArgumentList '-hz 60' -WindowStyle Hidden } "

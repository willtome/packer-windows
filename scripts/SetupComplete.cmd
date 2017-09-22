@echo off
@powershell -NonInteractive -NoProfile -ExecutionPolicy Unrestricted -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File C:\Windows\Temp\ansible.ps1' -Verb RunAs}"
exit /B %errorlevel%

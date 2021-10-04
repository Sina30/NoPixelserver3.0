@echo off
powershell "C:\Users\Administrator\Desktop\AbsoluteRp\server\FXServer.exe +exec resources.cfg +exec server.cfg +set onesync on +set sv_enforceGameBuild 2189| tee console_$(Get-Date -f yyyy-MM-dd-HHmm).log


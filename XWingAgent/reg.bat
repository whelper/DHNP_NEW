@echo off
"sc.exe" create DHNP_STOCK binPath= "D:\vs_workspace2010\DHNP\XWingAgent\bin\Debug\XWingAgent.exe" start= auto obj= "NT AUTHORITY\LOCALSERVICE" DisplayName= "DHNP Stock with E-Trade"
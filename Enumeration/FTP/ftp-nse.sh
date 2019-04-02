#!/bin/bash
if [ -z "$1" ]; then
    echo "[*] FTP NSE scan"
    echo "[*] Usage : $0 <target>"
    exit 0
fi
nmap -sV -Pn -vv -p21 --script=ftp-anon,ftp-bounce,ftp-libopie,ftp-proftpd-backdoor,ftp-syst,ftp-vsftpd-backdoor,ftp-vuln-cve2010-4221 -oA 'ftp-nse' $1

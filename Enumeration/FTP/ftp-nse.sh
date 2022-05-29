#!/usr/bin/env bash
usage () {
    echo "[*] FTP NSE scan"
    echo "[*] Usage : $0 <target>"
    echo "[*] Ex1 : $0 10.0.0.1-254"
    echo "[*] Ex2 : $0 192.168.1.20"
    exit 1
}

if [ $# -eq 1 ]; then
    nmap -sV -Pn -vv -p21 --script=ftp-anon,ftp-bounce,ftp-libopie,ftp-proftpd-backdoor,ftp-syst,ftp-vsftpd-backdoor,ftp-vuln-cve2010-4221 -oA "ftp-nse-$1" $1
    exit 0
else
    usage
fi

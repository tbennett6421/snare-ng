#!/usr/bin/env bash
usage () {
    echo "[*] NMAP Full TCP Scan"
    echo "[*] Usage : $0 <target>"
    exit 1
}

if [ $# -eq 1 ]; then
    nmap $1 -vv -n -sC -sV -O -sS -p- -oA $1_nmap_full
    exit 0
else
    usage
fi

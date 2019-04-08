#!/usr/bin/env bash
if [ -z "$1" ]; then
    echo "[*] NMAP Full TCP Scan"
    echo "[*] Usage : $0 <target>"
    exit 0
fi

nmap $1 -vv -n -sC -sV -O -sS -p- -oA $1_nmap_full
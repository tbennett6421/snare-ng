#!/usr/bin/env bash
if [ -z "$1" ]; then
    echo "[*] NMAP Quick Scan"
    echo "[*] Usage : $0 <target>"
    exit 0
fi

nmap $1 -vv -n -sC -sV -oA $1_nmap_quick

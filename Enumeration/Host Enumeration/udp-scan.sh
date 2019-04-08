#!/usr/bin/env bash
if [ -z "$1" ]; then
    echo "[*] NMAP UDP Scan"
    echo "[*] Usage : $0 <target>"
    exit 0
fi

nmap $1 -vv -n -sC -sV -O -sU --top-ports 20 -oA $1_nmap_udp

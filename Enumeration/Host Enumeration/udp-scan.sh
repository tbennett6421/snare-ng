#!/usr/bin/env bash
usage () {
    echo "[*] NMAP UDP Scan"
    echo "[*] Usage : $0 <target>"
    exit 1
}

if [ $# -eq 1 ]; then
    nmap $1 -vv -n -sC -sV -O -sU --top-ports 20 -oA $1_nmap_udp
    exit 0
else
    usage
fi

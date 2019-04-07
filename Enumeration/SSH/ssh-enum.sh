#!/usr/bin/env bash
if [ -z "$1" ]; then
    echo "[*] SSH Enum"
    echo "[*] Usage : $0 <target>"
    exit 0
fi

nmap $1 -p 22 -sV --script=ssh-hostkey -oA $1.ssh-hostkey

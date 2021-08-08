#!/usr/bin/env bash
if [ -z "$1" ]; then
    echo "[*] POP NSE"
    echo "[*] Usage : $0 <target>"
    exit 0
fi

nmap $1 -p 110,995 -sC -sV --script "pop3-capabilities or pop3-ntlm-info" -oA $1.pop

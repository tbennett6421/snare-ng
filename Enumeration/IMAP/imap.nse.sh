#!/usr/bin/env bash
if [ -z "$1" ]; then
    echo "[*] IMAP NSE"
    echo "[*] Usage : $0 <target>"
    exit 0
fi

nmap $1 -p 143,993 -sC -sV --script "imap-capabilities or imap-ntlm-info" -oA $1.imap

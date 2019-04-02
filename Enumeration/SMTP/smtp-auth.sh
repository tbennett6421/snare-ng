#!/bin/bash
if [ -z "$1" ]; then
    echo "[*] SMTP Auth"
    echo "[*] Usage : $0 <target>"
    exit 0
fi

smtp-user-enum -M VRFY -U /usr/share/seclists/Usernames/top_shortlist.txt -t $1 -p 25

#!/bin/bash
if [ $# -ne 2 ]; then
    echo "[*] SMTP Auth"
    echo "[*] Usage : $0 <target> <userlist>"
    exit 0
fi

smtp-user-enum -M VRFY -U $2 -t $1 -p 25

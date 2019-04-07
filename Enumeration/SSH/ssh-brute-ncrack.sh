#!/usr/bin/env bash
if [ $# -ne 3 ]; then
    echo "[*] SSH ncrack bruteforce"
    echo "[*] Usage : $0 <target> <user_file> <pass_file>"
    exit 0
fi
ncrack -vv -p 22 -U $2 -P $3 $1 -oA $1.ncrack

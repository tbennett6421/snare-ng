#!/usr/bin/env bash
if [ -z "$1" ]; then
    echo "[*] rpcclient null check"
    echo "[*] Usage : $0 <target>"
    exit 0
fi

#rpcclient -U "" -N 192.168.1.102
#> enumdomusers     # NULL connect:  enumerate users
#> queryuse 0x3e8   # detail info on RID 0x3e8

rpcclient -U "" -N $1 > >(tee -a $1.rpcclient.stdout.log) 2> >(tee -a $1.rpcclient.stderr.log >&2)

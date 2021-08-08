#!/usr/bin/env bash
if [ -z "$1" ]; then
    echo "[*] rpcinfo check"
    echo "[*] Usage : $0 <target>"
    exit 0
fi

rpcinfo $1 > >(tee -a $1.rpcinfo.stdout.log) 2> >(tee -a $1.rpcinfo.stderr.log >&2)

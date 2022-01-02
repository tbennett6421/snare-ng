#!/usr/bin/env bash
if [ -z "$1" ]; then
    echo "[*] enum4linux"
    echo "[*] Usage : $0 <target>"
    exit 0
fi

enum4linux -a $1 > $1_enum4linux.txt

#!/usr/bin/env bash
if [ $# -ne 2 ]; then
    echo "[*] snmpwalk"
    echo "[*] Usage : $0 <target> <community_string>"
    exit 0
fi

snmpwalk -c $2 -v1 $1 > >(tee -a $1.snmpwak.stdout.log) 2> >(tee -a $1.snmpwalk.stderr.log >&2)
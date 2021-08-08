#!/usr/bin/env bash
if [ -z "$1" ]; then
    echo "[*] nbtscan subnet scan"
    echo "[*] Usage : $0 <range/cidr>"
    exit 0
fi

nbtscan $1 > >(tee -a $1.nbtscan.stdout.log) 2> >(tee -a $1.nbtscan.stderr.log >&2)

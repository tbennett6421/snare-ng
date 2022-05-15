#!/usr/bin/env bash
if [ -z "$1" ]; then
    echo "[*] nbtscan subnet scan"
    echo "[*] Usage: $0 <range/cidr>"
    echo "[*] Example: $0 10.11.1.0/24"
    exit 0
fi

substr="${1%%/*}"
nbtscan $1 > >(tee -a $substr.nbtscan.stdout.log) 2> >(tee -a $substr.nbtscan.stderr.log >&2)

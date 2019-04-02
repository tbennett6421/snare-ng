#!/bin/bash
if [ -z "$1" ]; then
    echo "[*] nbtscan subnet scan"
    echo "[*] Usage : $0 <range/cidr>"
    exit 0
fi

nbtscan $1

#!/bin/bash
if [ $# -ne 2 ]; then
    echo "[*] OneSixtyOne Enum"
    echo "[*] Usage : $0 <hosts_list> <community_lists>"
    exit 0
fi

onesixtyone -c $2 -i $1 -o $1.onesixtyone.output

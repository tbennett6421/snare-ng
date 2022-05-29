
#!/usr/bin/env bash
usage () {
    echo "[*] NMAP Quick Scan"
    echo "[*] Usage : $0 <target>"
    exit 1
}

if [ $# -eq 1 ]; then
    nmap $1 -vv -n --open --reason -sC -sV -oA $1_nmap_quick
    exit 0
else
    usage
fi

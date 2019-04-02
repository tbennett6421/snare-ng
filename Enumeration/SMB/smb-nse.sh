#!/bin/bash
if [ -z "$1" ]; then
    echo "[*] SMB NSE scan"
    echo "[*] Usage : $0 <target>"
    exit 0
fi

nmap $1 -sC -sV -Pn -vv -sS -sU -p135,137-139,445 -oA $1.smb-nse \
--script=smb-vuln-cve-2017-7494, smb-vuln-ms06-025, smb-vuln-ms07-029, smb-vuln-ms08-067, smb-vuln-ms10-054, smb-vuln-ms10-061, smb-vuln-ms17-010, smb-vuln-webexec, \
smb-double-pulsar-backdoor, smb-mbenum, smb-os-discovery, smb-protocols, smb-security-mode, smb-server-stats, smb-system-info, msrpc-enum, nbstat, smb-ls, smb-enum-*

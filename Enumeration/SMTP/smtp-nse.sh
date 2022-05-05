#!/usr/bin/env bash
if [ -z "$1" ]; then
    echo "[*] SMTP NSE"
    echo "[*] Usage : $0 <target>"
    exit 0
fi

nmap $1 -p 25,465,587 -sC -sV --script "smtp-commands, smtp-enum-users, smtp-ntlm-info, smtp-vuln-cve2010-4344, smtp-vuln-cve2011-1720, smtp-vuln-cve2011-1764" -oA $1.smtp

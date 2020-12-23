#!/usr/bin/env bash
if [ -z "$1" ]; then
    echo "[*] DNS Zone Enumeration"
    echo "[*] Usage : $0 <domain name>"
    echo "[*] Ex1 : $0 example.org"
    exit 0
fi

# -d DOMAIN, --domain DOMAIN
#     Target domain.
# -t, --type        <types>    Type of enumeration to perform (comma separated):
#         std       SOA, NS, A, AAAA, MX and SRV.
#         rvl       Reverse lookup of a given CIDR or IP range.
#         brt       Brute force domains and hosts using a given dictionary.
#         srv       SRV records.
#         axfr      Test all NS servers for a zone transfer.
#         goo       Perform Google search for subdomains and hosts.
#         bing      Perform Google search for subdomains and hosts.
#         crt       Perform crt.sh search for subdomains and hosts.
#         snoop     Perform cache snooping against all NS servers for a given domain, testing
#                     all with file containing the domains, file given with -D option.
#         tld       Remove the TLD of given domain and test against all TLDs registered in IANA.

dnsrecon -d $1 -t zonewalk  > dns-$1-zonewalk.txt
dnsrecon -d $1 -t axfr > dns-$1.zonetranser.txt

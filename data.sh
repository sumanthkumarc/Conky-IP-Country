#!/bin/bash
ip=$(dig +short myip.opendns.com @resolver1.opendns.com)
#country=$(whois ${ip} | grep country -i -m 1 |cut -d ':' -f 2 | xargs)
country=$(whois ${ip} | awk -F':[ \t]+' 'tolower($1) ~ /^country$/ { print toupper($2) }' | sed -n -e '2{p;q}')
echo "IP: ${ip}"
echo "Country: ${country}"

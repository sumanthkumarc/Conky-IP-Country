#!/bin/bash
ip=$(dig +short myip.opendns.com @resolver1.opendns.com)
country=$(whois ${ip} | grep country -i -m 1 |cut -d ':' -f 2 | xargs)
echo "IP: ${ip}"
echo "Country: ${country}"
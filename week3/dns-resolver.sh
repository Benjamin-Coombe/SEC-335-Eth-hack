#!/bin/bash

network=$1
dns_server=$2

if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <network_prefix> <dns_server>"
    echo "Example: $0 10.0.5 8.8.8.8"
    exit 1
fi

echo "dns resolution for $network"

for i in {1..254}; do
    host="${network}.${i}"
    
     result=$(timeout 2 nslookup "$host" "$dns_server" 2>/dev/null | grep "name = " | awk '{print $4}')
    
    if [[ -n "$result" ]]; then
        echo "${i}.${network}.in-addr.arpa  name = ${result}"
    fi
done

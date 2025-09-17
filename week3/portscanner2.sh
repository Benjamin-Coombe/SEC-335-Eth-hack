#!/bin/bash

network=$1
port=$2

# Check arguments
if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <network_prefix> <port>"
    echo "Example: $0 10.0.5 53"
    exit 1
fi

echo "Scanning ${network}.1-254 on port $port"

# Scan the network range
for i in {1..254}; do
    host="${network}.${i}"
    if timeout 0.1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null; then
        echo "OPEN: $host:$port"
    fi
done

echo "Scan complete"

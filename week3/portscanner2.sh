#!bin/bash

network=$1
echo "host,port"
for i in {1..254}; do
	for port in $@; do
		timeout .1 bash -c "echo >/dev/tcp/$network.$i/$port" 2>/dev/nu && echo "$network.$i,$port"
	done
done

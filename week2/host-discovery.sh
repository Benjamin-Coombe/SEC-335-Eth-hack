#!/bin/bash

for ip in {2..50}; do (ping -c 1 -W 1 10.0.5.$ip >/dev/null 2>&1 && echo "10.0.5.$ip" >>sweep.txt) & done; wait

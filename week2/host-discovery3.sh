#!/bin/bash
nmap -sn 10.0.5.2-50 | grep "Nmap scan report" | awk '{print $5}' > sweep3.txt

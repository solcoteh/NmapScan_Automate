#!/bin/bash

# Ask for the IP address
read -p "Enter the target IP address: " IP

# Extract open ports and remove trailing comma
PORTS=$(nmap -p- $IP -T5 | grep -oE '[0-9]{1,5}/' | tr -d '\n' | tr '/' ',' | sed 's/,$//')

# Run nmap on the extracted ports
echo "Running nmap with the following ports: $PORTS"
nmap -p $PORTS -sV $IP -T5

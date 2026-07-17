#!/bin/bash
# Simple automation script to chain reconnaissance tools for target assessment

TARGET=$1
if [ -z "$TARGET" ]; then
    echo "Usage: ./recon_automation.sh <IP_or_Domain>"
    exit 1
fi

echo "[+] Starting Nmap Scan on $TARGET..."
nmap -sV -p 80,3306 "$TARGET" -oN nmap_recon.txt

echo "[+] Running Nikto Scan on $TARGET..."
nikto -h "http://$TARGET/" -output nikto_recon.txt

echo "[+] Reconnaissance phase completed. Outputs saved to local directory."
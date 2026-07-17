# Tools and Environment Configurations

This directory documents the specific tools and versions used during the web application penetration testing of the target environment.

## 1. Active Reconnaissance & Port Scanning
* **Tool:** Nmap v7.9x
* **Command Used:** `nmap -sV -sC -p 80,3306 <target-ip>`
* **Purpose:** Service version detection and default script scanning on HTTP and MySQL ports.

## 2. Directory & Path Fuzzing
* **Tool:** FFUF (Fuzz Faster U Fool) v2.1.0
* **Command Used:** `ffuf -w /usr/share/wordlists/dirb/common.txt -u http://<target-ip>/DVWA/FUZZ`
* **Purpose:** Discovering hidden directories, sensitive configuration paths, and unlinked endpoints.

## 3. Vulnerability Scanning
* **Tool:** Nikto v2.5.0
* **Command Used:** `nikto -h http://<target-ip>/DVWA/`
* **Purpose:** Identifying server misconfigurations, outdated software signatures, and missing HTTP headers.

## 4. Traffic Interception & Manual Exploitation
* **Tool:** Burp Suite Community Edition v2024.x
* **Configurations:** Configured local browser traffic to route via proxy listener (`127.0.0.1:8080`) to capture, analyze, and replay raw POST requests in Repeater.
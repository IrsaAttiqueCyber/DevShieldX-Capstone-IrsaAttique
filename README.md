# Enterprise Web Application Security Assessment - DVWA

This repository contains the comprehensive, black-box penetration testing report and validated Proof-of-Concept (PoC) artifacts for a security assessment conducted against the **Damn Vulnerable Web Application (DVWA)**. The assessment strictly adhered to the industry-standard **OWASP Web Security Testing Guide (WSTG)** framework.

---

## 📋 Executive Summary
A structural security evaluation of the target application revealed critical-severity flaws including **Remote Code Execution (RCE)** and **SQL Injection (Credential Disclosure)**. These issues allow complete underlying system compromise and unauthorized data extraction. Immediate code-level remediation is detailed below to secure the deployment.

---

## 🛠️ Tech Stack & Lab Environment
* **Target Application:** Damn Vulnerable Web Application (DVWA)
* **Base OS:** Debian Linux / Kali Linux
* **Web Server:** Apache HTTP Server v2.4.63
* **Database Engine:** MariaDB v11.4.5
* **Primary Tools:** `Nmap`, `Nikto`, `FFUF`, `WhatWeb`, `Burp Suite Professional`

---

## 🔍 Methodology (OWASP WSTG)
The assessment followed a highly organized five-stage security evaluation lifecycle:
1. **Reconnaissance:** Footprinting server signatures, open ports, and active web properties.
2. **Attack Surface Mapping:** Enumerating hidden administrative endpoints and orphaned source control configurations.
3. **Vulnerability Assessment:** Identifying misconfigurations, missing secure headers, and operational flaws.
4. **Exploitation:** Executing structured manual exploits to prove risk impact on the backend.
5. **Reporting & Remediation:** Documenting technical findings and implementing programmatic patches.

---

## 🚀 Validated Vulnerabilities & Proof-of-Concept

### 1. Remote Code Execution (RCE) via OS Command Injection
* **Endpoint:** `/vulnerabilities/exec/`
* **Vulnerability:** Lack of input sanitization allowed arbitrary system shell command injection.
* **Exploit Payload:** `127.0.0.1 && whoami`
* **Impact:** Executed commands under the privilege context of the web server (`www-data`), indicating full host compromise potential.

#### Baseline Test:
![Standard Ping Workings](5.png)

#### Exploitation Proof:
![Command Injection Execution](6.png)

---

### 2. Database Credential Disclosure via SQL Injection
* **Endpoint:** `/vulnerabilities/sqli/`
* **Vulnerability:** Unparameterized input parameters passed directly into the SQL interpreter.
* **Exploit Payload:** `1' UNION SELECT user, password FROM users#`
* **Impact:** Unauthenticated retrieval of administrative credentials, dumping user tables and password hashes directly.

#### Baseline Test:
![Baseline SQL Query](7_2.png)

#### Exploitation Proof:
![SQL Injection Dump](8_2.png)

---

## 🛡️ Remediation Overview

### OS Command Injection Fix (PHP)
Avoid raw execution wrappers. Implement strong validation filters on dynamic parameters:


###SQL Injection Fix 
Bind variables securely using parameterized SQL statements:

$id = $_GET['id'];
$stmt = $pdo->prepare('SELECT first_name, last_name FROM users WHERE user_id = :id');
$stmt->execute(['id' => $id]);
$user = $stmt->fetch();

--

##Reconnaissance and Mapping Footprints
###Technology Footprinting
Using WhatWeb to fingerprint active server signatures and web technologies.

###Network Port Profiling
Utilizing Nmap for scanning open ports, service versions, and operating system detection.

###Automated Vulnerability Identification
Running Nikto scans to identify server misconfigurations and outdated packages.

###Passive Directory Finding
Searching public directories and mapping exposed assets without direct active interactions.

###Directory Fuzzing
Using FFUF (Fuzz Faster U Fool) to enumerate hidden endpoints, directories, and files.

--

##Environment Setup & Manual Proxy Testing
###Lab Services Initialization
Setting up the virtual networking environment and starting required local services.

###Setting Target Environment
Configuring DVWA security levels and validating system connectivity.

###Manual Proxy Analysis
Routing browser traffic through Burp Suite Professional to capture, analyze, and manipulate HTTP requests.

--

##Credentials & Contact

Name:                Irsa Attique
Academic Background: BS Cyber Security, COMSATS University Islamabad
Affiliation:         Dev ShieldX (Internship Capstone Project)

# Enterprise Web Application Security Assessment — DVWA

This repository contains a comprehensive, black-box penetration testing report and validated Proof-of-Concept (PoC) artifacts for a security assessment conducted against the **Damn Vulnerable Web Application (DVWA)**. The assessment strictly adhered to the industry-standard **OWASP Web Security Testing Guide (WSTG)** framework.

## 📋 Executive Summary

A structural security evaluation of the target application revealed **critical-severity vulnerabilities**, including **Remote Code Execution (RCE)** and **SQL Injection resulting in credential disclosure**.

These vulnerabilities could enable complete compromise of the underlying system and unauthorized data extraction. Immediate code-level remediation recommendations are detailed below to improve the security posture of the deployment.

## 🛠️ Tech Stack & Lab Environment

- **Target Application:** Damn Vulnerable Web Application (DVWA)
- **Base OS:** Debian Linux / Kali Linux
- **Web Server:** Apache HTTP Server v2.4.63
- **Database Engine:** MariaDB v11.4.5
- **Primary Tools:** Nmap, Nikto, FFUF, WhatWeb, Burp Suite Professional

## 🔍 Methodology — OWASP WSTG

The assessment followed a structured five-stage security evaluation lifecycle:

1. **Reconnaissance:** Footprinting server signatures, open ports, and active web properties.
2. **Attack Surface Mapping:** Enumerating hidden administrative endpoints and exposed source control configurations.
3. **Vulnerability Assessment:** Identifying security misconfigurations, missing security headers, and operational weaknesses.
4. **Exploitation:** Executing structured manual exploits to validate vulnerability impact on the backend.
5. **Reporting & Remediation:** Documenting technical findings and proposing programmatic remediation measures.

## 🚀 Validated Vulnerabilities & Proof-of-Concept

### 1. Remote Code Execution (RCE) via OS Command Injection

- **Endpoint:** `/vulnerabilities/exec/`
- **Vulnerability:** Insufficient input sanitization allowed arbitrary system command injection.
- **Exploit Payload:** `127.0.0.1 && whoami`
- **Impact:** Commands were executed under the privilege context of the web server user (`www-data`), demonstrating the potential for complete host compromise.

#### Baseline Test

Standard Ping Functionality

#### Exploitation Proof

Command Injection Execution

### 2. Database Credential Disclosure via SQL Injection

- **Endpoint:** `/vulnerabilities/sqli/`
- **Vulnerability:** Unparameterized user input was passed directly to the SQL interpreter.
- **Exploit Payload:** `1' UNION SELECT user, password FROM users#`
- **Impact:** Unauthorized retrieval of administrative credentials, including user records and password hashes.

#### Baseline Test

Baseline SQL Query

#### Exploitation Proof

SQL Injection Data Dump

## 🛡️ Remediation Overview

### OS Command Injection Remediation

Avoid raw command execution wrappers and implement strict input validation and allowlisting for dynamic parameters.

### SQL Injection Remediation

Use parameterized queries and bind variables securely instead of concatenating user-controlled input directly into SQL statements.

```php
$id = $_GET['id'];

$stmt = $pdo->prepare(
    'SELECT first_name, last_name 
     FROM users 
     WHERE user_id = :id'
);

$stmt->execute(['id' => $id]);

$user = $stmt->fetch();

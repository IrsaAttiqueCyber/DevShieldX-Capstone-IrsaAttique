# Security Reference Materials & Standards

This directory contains reference resources and mappings utilized to classify, risk-score, and remediate the discovered web application vulnerabilities.

## Reference Standards Mapped
* **OWASP WSTG v4.2:** Web Security Testing Guide reference framework used to conduct systematic black-box testing.
* **CVSS v3.1 Calculator:** Common Vulnerability Scoring System criteria utilized for consistent vulnerability severity classification.

## Remediation Resources Referenced
1. **OS Command Injection Prevention:** Refer to the *OWASP Command Injection Prevention Cheat Sheet*.
   * Enforce strict input validation using character whitelists.
   * Utilize language-specific API calls rather than executing direct system shell commands.
2. **SQL Injection Prevention:** Refer to the *OWASP SQL Injection Prevention Cheat Sheet*.
   * Mandate Parameterized Queries (Prepared Statements) for all database transactions.
   * Avoid direct dynamic string concatenation within SQL statements.
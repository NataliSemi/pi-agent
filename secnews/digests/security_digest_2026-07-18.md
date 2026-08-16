# Cybersecurity + Security+ Digest - 2026-07-18

## CISA urges immediate action on actively exploited Fortinet flaws

**Source:** BleepingComputer

**Published:** Fri, 17 Jul 2026 03:03:33 -0400

**Link:** https://www.bleepingcomputer.com/news/security/cisa-warns-feds-to-patch-exploited-fortinet-fortisandbox-flaws-by-sunday/

**Relevance: High**

**Reason:** The article highlights two critical security flaws in Fortinet's FortiSandbox platform that have been actively exploited by threat actors, indicating a high risk of cyber attacks. These vulnerabilities could be used to execute unauthorized code remotely through command injection attacks, posing significant risks to network security.

**Summary:**
- **Bullet 1:** CISA urges government agencies to patch two critical-severity FortiSandbox flaws.
- **Bullet 2:** Defused revealed attackers are abusing these vulnerabilities in the wild.
- **Bullet 3:** U.S. federal agencies must upgrade their FortiSandbox instances by July 19, 2026.

**Security+ domain: Threats, Vulnerabilities, and Mitigations**

**Key terms:**
- CVE
- Command injection
- Exploitation

**Defensive lesson:**
- Implement strong security measures to protect against command injection attacks.

### Security+ Practice Question

**Question:** Which action best helps an organization recover from ransomware?

A) Paying the ransom immediately
B) Maintaining tested offline backups
C) Disabling all monitoring tools
D) Sharing privileged credentials

**Correct answer:** B

**Explanation:** Tested offline backups allow recovery without relying on the attacker.

---

## US charges two over laundering $43 million from investment fraud

**Source:** BleepingComputer

**Published:** Fri, 17 Jul 2026 04:13:37 -0400

**Link:** https://www.bleepingcomputer.com/news/security/us-charges-two-over-laundering-43-million-from-investment-fraud/

**Relevance: High**

**Reason:** This article highlights the significant impact of cyber investment fraud on individuals and society, emphasizing the importance of cybersecurity in protecting against such financial crimes. The involvement of sophisticated networks to launder stolen funds underscores the need for robust security measures to prevent money laundering.

**Summary:**
- **Bullet 1**: Two Chinese nationals were charged with conspiracy to commit money laundering related to a large-scale cyber investment fraud ring.
- **Bullet 2**: This case involved transferring $43 million in proceeds from fraudulent investments laundered through over 100 bank accounts and shell companies, targeting victims' life savings.
- **Bullet 3**: The article also mentions the FBI's 2025 Internet Crime Report showing that investment fraud was a leading cause of scam-related incidents, with reported losses increasing significantly.

**Security+ Domain:**
- **Threats, Vulnerabilities, and Mitigations**

**Key Terms:**
- **Term 1**: Cyber Investment Fraud
- **Term 2**: Money Laundering
- **Term 3**: Shell Companies

**Defensive Lesson:**
- Implement strong cybersecurity measures to protect against investment fraud scams. This includes using reputable financial platforms, verifying investments thoroughly before making any deposits, and being cautious of suspicious emails or messages from unknown sources.

### Security+ Practice Question

**Question:** Which Security+ concept helps organizations choose controls based on likelihood and impact?

A) Risk management
B) Password sharing
C) Disabling logs
D) Ignoring vulnerabilities

**Correct answer:** A

**Explanation:** Risk management helps prioritize controls based on business impact and threat likelihood.

---

## Windows Server 2022 reach end of mainstream support in 90 days

**Source:** BleepingComputer

**Published:** Fri, 17 Jul 2026 05:10:15 -0400

**Link:** https://www.bleepingcomputer.com/news/microsoft/windows-server-2022-reach-end-of-mainstream-support-in-90-days/

**Relevance: High**

**Reason:** This article is highly relevant for cybersecurity learners as it discusses the end of support for Windows Server 2022, which will affect organizations that have invested in this version. Understanding the implications and planning for a smooth transition to newer versions is crucial for maintaining security posture.

**Summary:**
- Bullet 1: Microsoft announced that Windows Server 2022 will reach its mainstream end date on October 13, 2026.
- Bullet 2: The last mainstream support update for this version will be the October 2026 security update. After this date, it will transition to extended support with no additional cost and continued monthly updates until October 14, 2031.
- Bullet 3: Windows Server 2025, the latest LTSC release, is now available for general availability in November 2024. It reaches end of support on November 13, 2029, with extended support ending five years later.

**Security+ Domain:**
- **Threats, Vulnerabilities, and Mitigations**

**Key Terms:**
- Term 1: Extended Support
- Term 2: Long-Term Servicing Channel (LTSC)
- Term 3: Security Updates

**Defensive Lesson:**
- Plan to upgrade to Windows Server 2025 for full mainstream support before the end of its extended support on November 14, 2034.

### Security+ Practice Question

**Question:** After a critical vulnerability is announced, what should defenders do first?

A) Ignore it until exploitation is confirmed
B) Assess exposure and prioritize remediation based on risk
C) Disable all network access permanently
D) Delete all logs

**Correct answer:** B

**Explanation:** Security+ emphasizes risk-based vulnerability management.

---

## New Windows LegacyHive zero-day gives hackers admin privileges

**Source:** BleepingComputer

**Published:** Fri, 17 Jul 2026 07:05:30 -0400

**Link:** https://www.bleepingcomputer.com/news/security/new-windows-legacyhive-zero-day-exploit-grants-hackers-admin-access/

Relevance: High

Reason:
This exploit demonstrates the vulnerability in the Windows User Profile Service, which has yet to receive a CVE ID for easier tracking. The modification of the PoC credentials makes it harder for attackers to weaponize the vulnerability, highlighting the importance of timely patching and updating systems.

Summary:
- LegacyHive is a zero-day exploit that allows non-admin users to escalate privileges on up-to-date Windows systems.
- It requires additional credentials, making it less likely to be exploited publicly.
- The PoC was stripped down as an attempt to prevent public exploitation but still allowed the modification of the classes registry hive and automatic code execution.

Security+ domain: Threats, Vulnerabilities, and Mitigations

Key terms:
- Windows User Profile Service
- CVE ID
- Proof-of-Concept (PoC)

Defensive lesson:
- Regularly update systems to patch vulnerabilities promptly.

### Security+ Practice Question

**Question:** Which control best reduces the risk of successful phishing attacks?

A) Disabling audit logs
B) Security awareness training and MFA
C) Using shared administrator accounts
D) Removing endpoint protection

**Correct answer:** B

**Explanation:** Security awareness training helps users identify phishing, while MFA reduces the impact of stolen credentials.

---

## Inside the Search for "Clean" Residential Proxies for Carding

**Source:** BleepingComputer

**Published:** Fri, 17 Jul 2026 10:00:10 -0400

**Link:** https://www.bleepingcomputer.com/news/security/inside-the-search-for-clean-residential-proxies-for-carding/

Relevance: High

Reason: This article highlights the evolving nature of residential proxies in carding, emphasizing their importance and fragility. Understanding these dynamics is crucial for cybersecurity learners as it underscores how attackers are becoming more sophisticated in their methods.

Summary:
1. Carders increasingly judge a proxy by its history, not merely whether it belongs to a residential internet provider.
2. Geographic consistency now extends beyond country matching to city, ZIP code, time zone, browser language, and billing information.
3. Residential IPs are rarely considered sufficient alone and are frequently paired with antidetect browsers and fingerprint manipulation.

Security+ domain: General Security Concepts

Key terms:
- Carding
- Residential proxies
- Identity simulation stack
- Antidetect browsers
- Financial services blockages

Defensive lesson:
Residential proxies should be used cautiously, as they may not provide the level of anonymity expected. Combining them with other techniques to create a convincing digital identity is becoming more common among carders.

### Security+ Practice Question

**Question:** Which Security+ concept helps organizations choose controls based on likelihood and impact?

A) Risk management
B) Password sharing
C) Disabling logs
D) Ignoring vulnerabilities

**Correct answer:** A

**Explanation:** Risk management helps prioritize controls based on business impact and threat likelihood.

---

## Ernst & Young discloses data breach after support system hack

**Source:** BleepingComputer

**Published:** Fri, 17 Jul 2026 10:55:28 -0400

**Link:** https://www.bleepingcomputer.com/news/security/ernst-and-young-discloses-data-breach-after-support-system-hack/

**Relevance: High**

**Reason:** This article highlights the importance of securing third-party systems and monitoring for unauthorized access, which is crucial knowledge for cybersecurity learners. It demonstrates how companies can be vulnerable to data breaches through their partners or external services.

**Summary:**
1. Ernst & Young disclosed a significant data breach due to an unauthorized access to its support ticket system.
2. The compromised platform included sensitive information such as client tax documents, raising concerns about the security of third-party systems and customer trust.
3. The company has taken steps to secure its systems and notified law enforcement, but it is unclear how many customers were affected or if the breach impacts other regions.

**Security+ domain: 2. Threats, Vulnerabilities, and Mitigations**

**Key terms:**
- Third-party system compromise
- Unauthorized access
- Data breaches

**Defensive lesson:**
1. Implement strict monitoring of third-party systems to detect unauthorized access.
2. Regularly update security measures to protect against new threats.

### Security+ Practice Question

**Question:** Which action best helps an organization recover from ransomware?

A) Paying the ransom immediately
B) Maintaining tested offline backups
C) Disabling all monitoring tools
D) Sharing privileged credentials

**Correct answer:** B

**Explanation:** Tested offline backups allow recovery without relying on the attacker.

---

## HollowByte DDoS flaw bloats OpenSSL server memory with 11-byte payload

**Source:** BleepingComputer

**Published:** Fri, 17 Jul 2026 13:56:21 -0400

**Link:** https://www.bleepingcomputer.com/news/security/hollowbyte-ddos-flaw-bloats-openssl-server-memory-with-11-byte-payload/

**Relevance: High**

**Reason:** This vulnerability allows unauthenticated attackers to trigger a denial-of-service condition on OpenSSL servers with a malicious payload of just 11 bytes, impacting the foundational backbone of secure internet communication. Organizations should prioritize switching to a fixed version of the library.

### Summary:

- **Bullet 1**: The HollowByte DDoS flaw exploits an unvalidated TLS handshake header length field in vulnerable OpenSSL versions.
  
- **Bullet 2**: An attacker can trigger this by sending malicious input with a header claiming larger data, causing the server to allocate excessive memory.

- **Bullet 3**: Organizations should switch to a fixed version of OpenSSL to mitigate this risk and ensure secure internet communication.

### Security+ Domain:

**Key terms:**
- TLS
- Denial-of-Service (DoS)
- OpenSSL

**Defensive lesson:**
- Implement proper validation checks for message sizes in the TLS handshake process.

### Security+ Practice Question

**Question:** After a critical vulnerability is announced, what should defenders do first?

A) Ignore it until exploitation is confirmed
B) Assess exposure and prioritize remediation based on risk
C) Disable all network access permanently
D) Delete all logs

**Correct answer:** B

**Explanation:** Security+ emphasizes risk-based vulnerability management.

---

## Abbott probes two cyber incidents amid extortion claims

**Source:** BleepingComputer

**Published:** Fri, 17 Jul 2026 16:45:52 -0400

**Link:** https://www.bleepingcomputer.com/news/security/abbott-laboratories-probes-two-cyber-incidents-amid-extortion-claims/

**Relevance: High**

**Reason:** This article highlights Abbott Laboratories' response to two significant cybersecurity incidents, including the extortion claim and data breach. These events are relevant for cybersecurity learners as they demonstrate how organizations can be targeted by both external threats (extortion) and internal vulnerabilities (data breaches), emphasizing the importance of comprehensive security measures across all business units.

**Summary:**
- Abbott Laboratories is investigating unauthorized access to its legacy Exact Sciences systems in its Cancer Diagnostics business.
- The company confirmed a cyber incident involving ShinyHunters extortion gang, which threatened to publish stolen data unless negotiated with the group.
- Abbott activated incident response procedures and engaged cybersecurity experts after learning of the breach.

**Security+ Domain: Threats, Vulnerabilities, and Mitigations**

**Key Terms:**
- Cybersecurity
- Extortion
- Data Breach
- Legacy Systems

**Defensive Lesson:**
- Implement multi-layered security measures to protect against both external threats and internal vulnerabilities.
- Regularly update software and patch systems promptly to mitigate known vulnerabilities.

### Security+ Practice Question

**Question:** Which control best reduces the risk of successful phishing attacks?

A) Disabling audit logs
B) Security awareness training and MFA
C) Using shared administrator accounts
D) Removing endpoint protection

**Correct answer:** B

**Explanation:** Security awareness training helps users identify phishing, while MFA reduces the impact of stolen credentials.

---


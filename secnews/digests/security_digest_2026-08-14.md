# Cybersecurity + Security+ Digest - 2026-08-14

## Trezor discloses data breach affecting nearly 14,000 customers

**Source:** BleepingComputer

**Published:** Thu, 13 Aug 2026 11:13:19 -0400

**Link:** https://www.bleepingcomputer.com/news/security/trezor-discloses-data-breach-affecting-nearly-14-000-customers/

**Relevance: High**

**Reason:** This incident highlights the importance of securing third-party providers and understanding potential vulnerabilities in those systems. It also emphasizes the need for customers to be cautious about phishing attempts, which is crucial knowledge for cybersecurity learners.

**Summary:**
1. **Trezor Discloses Data Breach Affecting Nearly 14,000 Customers:** Hardware wallet manufacturer Trezor disclosed a data breach affecting nearly 14,000 of its customers after ShipMonk, its shipping and logistics provider, was hacked.
2. **Customers' Personal Information at Risk:** The attackers gained access to customers' order data, including full names, shipping addresses, email addresses, and phone numbers.
3. **No Impact on Company Operations:** Despite the breach, Trezor's operations or services were not affected, and its systems were not compromised.

**Security+ Domain: Threats, Vulnerabilities, and Mitigations**

**Key Terms:**
- Third-party vulnerability exploitation
- Phishing attempts

**Defensive Lesson:**
- Be cautious about messages requesting personal information.
- Use strong security practices to protect against phishing attacks.

### Security+ Practice Question

**Question:** Which control best reduces the risk of successful phishing attacks?

A) Disabling audit logs
B) Security awareness training and MFA
C) Using shared administrator accounts
D) Removing endpoint protection

**Correct answer:** B

**Explanation:** Security awareness training helps users identify phishing, while MFA reduces the impact of stolen credentials.

---

## Critical VMware vCenter RCE flaw exploited for reverse SSH access

**Source:** BleepingComputer

**Published:** Thu, 13 Aug 2026 12:40:23 -0400

**Link:** https://www.bleepingcomputer.com/news/security/critical-vmware-vcenter-rce-flaw-exploited-for-reverse-ssh-access/

**Relevance: High**

**Reason:** This article highlights a critical vulnerability in VMware vCenter Syslog Server that has been exploited to deploy reverse SSH access, allowing for persistent and remote control. The widespread compromise of 361 IP addresses across multiple countries underscores the severity of this issue, making it highly relevant for cybersecurity learners.

---

**Summary:**
- **Bullet 1:** Broadcom disclosed a critical vulnerability in VMware vCenter Syslog Server.
- **Bullet 2:** An unauthenticated attacker exploited this vulnerability to deploy reverse SSH access.
- **Bullet 3:** The attack was observed on compromised systems starting August 3, with the count increasing rapidly over subsequent days.

**Security+ Domain: Threats, Vulnerabilities, and Mitigations**

**Key Terms:**
- CVE-2026-59310
- vCenter Syslog Server
- Reverse SSH

**Defensive Lesson:**
- **Practical Defensive Takeaway:** Implement strong security measures to protect against directory traversal vulnerabilities. Regularly update software components and keep systems patched to mitigate such risks.

### Security+ Practice Question

**Question:** After a critical vulnerability is announced, what should defenders do first?

A) Ignore it until exploitation is confirmed
B) Assess exposure and prioritize remediation based on risk
C) Disable all network access permanently
D) Delete all logs

**Correct answer:** B

**Explanation:** Security+ emphasizes risk-based vulnerability management.

---

## Microsoft patches LegacyHive Windows zero-day vulnerability

**Source:** BleepingComputer

**Published:** Thu, 13 Aug 2026 13:46:20 -0400

**Link:** https://www.bleepingcomputer.com/news/microsoft/microsoft-patches-legacyhive-windows-zero-day-vulnerability/

**Relevance: High**

**Reason:** This article highlights a significant security vulnerability in Windows that has been exploited by an anonymous researcher, demonstrating the importance of continuous patch management and vigilance against zero-day vulnerabilities. Understanding how such exploits can be weaponized is crucial for learners to enhance their defensive strategies.

**Summary:**
- **Bullet 1:** Microsoft has patched a Windows zero-day vulnerability known as "LegacyHive."
- **Bullet 2:** The exploit was disclosed by an anonymous researcher who published a proof-of-concept (PoC) hours after the July Patch Tuesday updates.
- **Bullet 3:** The PoC requires additional credentials, making it harder for threat actors to weaponize the vulnerability.

**Security+ Domain: Threats, Vulnerabilities, and Mitigations**

**Key Terms:**
- Zero-day
- Proof-of-concept (PoC)
- Windows User Profile Service

**Defensive Lesson:**
- **Practical Defensive Takeaway:** Stay informed about security updates and vulnerabilities. Regularly patch systems to mitigate risks from newly discovered exploits.

### Security+ Practice Question

**Question:** Which control best reduces the risk of successful phishing attacks?

A) Disabling audit logs
B) Security awareness training and MFA
C) Using shared administrator accounts
D) Removing endpoint protection

**Correct answer:** B

**Explanation:** Security awareness training helps users identify phishing, while MFA reduces the impact of stolen credentials.

---

## Hackers breach govt webmail while running parallel crypto fraud

**Source:** BleepingComputer

**Published:** Thu, 13 Aug 2026 14:15:19 -0400

**Link:** https://www.bleepingcomputer.com/news/security/hackers-breach-govt-webmail-while-running-parallel-crypto-fraud/

### Relevance: High

**Reason:** The article highlights the threat actor Jewelbug's dual operations targeting government agencies and engaging in cryptocurrency fraud, indicating a high level of cybersecurity risk. This combination suggests that the group is capable of both espionage and financial crime, making them a significant concern for organizations with sensitive data.

### Summary:

- **Bullet 1:** Jewelbug compromised webmail accounts belonging to 15 government tenants while conducting a campaign targeting a Middle Eastern country.
  
- **Bullet 2:** The threat actor used the same control panel for both espionage and cryptocurrency fraud, suggesting they may operate as a hack-for-hire group.

- **Bullet 3:** Researchers found that the malicious script was inserted into the common template of Jewelbug's webmail installation, allowing it to exfiltrate cookies and retrieve email addresses.

### Security+ Domain:
**2. Threats, Vulnerabilities, and Mitigations**

### Key Terms:
- **Jewelbug**
- **Earth Alux**
- **REF7707**
- **Symantec**
- **WebSocket connection**
- **C2 server**
- **Antino backdoor**
- **XG-Web remote-access and data-theft framework**

### Defensive Lesson:
**One Practical Defense:**
Implement multi-factor authentication (MFA) for webmail accounts to prevent unauthorized access. Additionally, regularly update software and patch vulnerabilities to reduce the risk of exploitation by threat actors.

### Security+ Practice Question

**Question:** Which control best reduces the risk of successful phishing attacks?

A) Disabling audit logs
B) Security awareness training and MFA
C) Using shared administrator accounts
D) Removing endpoint protection

**Correct answer:** B

**Explanation:** Security awareness training helps users identify phishing, while MFA reduces the impact of stolen credentials.

---

## Akira hackers disable EDR with Safe Mode, steal data but fail to encrypt

**Source:** BleepingComputer

**Published:** Thu, 13 Aug 2026 16:47:02 -0400

**Link:** https://www.bleepingcomputer.com/news/security/akira-hackers-disable-edr-with-safe-mode-steal-data-but-fail-to-encrypt/

**Relevance: High**

**Reason:** This article highlights the importance of endpoint detection and response (EDR) systems in protecting against advanced threats. The Akira ransomware affiliate's successful attack on an EDR-enabled system demonstrates how attackers can bypass traditional security measures by disabling them, leading to data theft without encryption.

**Summary:**
- **Bullet 1:** An Akira ransomware affiliate disabled the endpoint detection and response (EDR) solution on a compromised system.
- **Bullet 2:** The attack occurred after obtaining initial access through an exposed SonicWall VPN device without multi-factor authentication.
- **Bullet 3:** The attackers enumerated Active Directory users and computers, moved to an application server, and used WinRAR and s5cmd to steal data before installing AnyDesk for remote access.

**Security+ Domain: Threats, Vulnerabilities, and Mitigations**

**Key Terms:**
- Akira ransomware
- Endpoint detection and response (EDR)
- SonicWall VPN device
- Multi-factor authentication (MFA)

**Defensive Lesson:**
- **Practical Defensive Takeaway:** Implementing robust EDR solutions is crucial for detecting and responding to advanced threats, even when attackers disable them.

### Security+ Practice Question

**Question:** Which control best reduces the risk of successful phishing attacks?

A) Disabling audit logs
B) Security awareness training and MFA
C) Using shared administrator accounts
D) Removing endpoint protection

**Correct answer:** B

**Explanation:** Security awareness training helps users identify phishing, while MFA reduces the impact of stolen credentials.

---

## Ukraine shuts down 94 fraudulent call centers, seize millions in cash

**Source:** BleepingComputer

**Published:** Thu, 13 Aug 2026 17:12:47 -0400

**Link:** https://www.bleepingcomputer.com/news/security/ukraine-shuts-down-94-fraudulent-call-centers-seize-millions-in-cash/

**Relevance: High**

**Reason:** This article highlights the significant impact of fraudulent call centers on cybersecurity, focusing on the exploitation of individuals through financial and identity theft. The operation involved shutting down 94 fraudulent call centers that lured people into investment scams or attempted to access bank accounts, demonstrating the importance of robust cybersecurity measures in preventing such attacks.

**Summary:**
- Authorities shut down 94 fraudulent call centers.
- Total searches conducted: 411.
- Seized items include 1,794 workstations, 3,336 computers, 1,346 phones, and 5,200 SIM cards.
- $2 million, 64,000 euros, and 22 vehicles seized.
- 26 individuals formally notified as suspects.

**Security+ Domain: Threats, Vulnerabilities, and Mitigations**

**Key Terms:**
- Fraudulent call centers
- Investment scams
- Bank account access

**Defensive Lesson:**
- Implement multi-factor authentication for all financial transactions.
- Regularly update software and security patches to protect against vulnerabilities.

### Security+ Practice Question

**Question:** After a critical vulnerability is announced, what should defenders do first?

A) Ignore it until exploitation is confirmed
B) Assess exposure and prioritize remediation based on risk
C) Disable all network access permanently
D) Delete all logs

**Correct answer:** B

**Explanation:** Security+ emphasizes risk-based vulnerability management.

---

## Apple sends new ‘Threat Notification’ alerts over mercenary spyware attacks

**Source:** BleepingComputer

**Published:** Thu, 13 Aug 2026 21:19:12 -0400

**Link:** https://www.bleepingcomputer.com/news/apple/apple-sends-new-threat-notification-alerts-over-mercenary-spyware-attacks/

**Relevance: High**

**Reason:** This article highlights the importance of threat intelligence and security awareness in preventing targeted cyberattacks, which is crucial for cybersecurity learners. Understanding how Apple detects and responds to mercenary spyware attacks can help learners recognize potential threats and improve their ability to protect against similar sophisticated attacks.

**Summary:**
- **Bullet 1:** Apple sends "Threat Notifications" to users after detecting highly targeted mercenary spyware attacks.
- **Bullet 2:** These notifications are part of a recurring feature since 2021, indicating ongoing security concerns.
- **Bullet 3:** The article emphasizes the high cost and sophistication of these attacks, making them difficult to detect and prevent.

**Security+ Domain: Threats, Vulnerabilities, and Mitigations**

**Key Terms:**
- Mercenary Spyware
- Targeted Attacks
- Sophisticated Cybersecurity

**Defensive Lesson:**
- Stay informed about security threats and vulnerabilities in your environment.
- Regularly update software to patch known vulnerabilities.

### Security+ Practice Question

**Question:** After a critical vulnerability is announced, what should defenders do first?

A) Ignore it until exploitation is confirmed
B) Assess exposure and prioritize remediation based on risk
C) Disable all network access permanently
D) Delete all logs

**Correct answer:** B

**Explanation:** Security+ emphasizes risk-based vulnerability management.

---


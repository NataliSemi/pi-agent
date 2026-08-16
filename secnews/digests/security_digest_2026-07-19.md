# Cybersecurity + Security+ Digest - 2026-07-19

## The Future of Age Verification: Your Face Never Leaves Your Device

**Source:** BleepingComputer

**Published:** Sat, 18 Jul 2026 09:15:24 -0400

**Link:** https://www.bleepingcomputer.com/news/security/the-future-of-age-verification-your-face-never-leaves-your-device/

**Relevance: High**

**Reason:** The article discusses the increasing importance of age verification in various jurisdictions worldwide, which is directly relevant to cybersecurity learners. Understanding how platforms verify users' ages and the ethical implications of collecting facial data are crucial skills for a security professional.

**Summary:**
- **Bullet 1:** Age verification laws are becoming mandatory globally.
- **Bullet 2:** Facial recognition technology is being used as an accessible method for age verification, especially for younger users.
- **Bullet 3:** The article highlights the challenges of server-based age estimation and emphasizes the need for more secure alternatives.

**Security+ Domain:**
- **Key terms:** Age Verification, Facial Recognition, Identity Theft Resource Center
- **Defensive lesson:** Implementing robust security measures to protect user data and privacy in compliance with legal requirements.

### Security+ Practice Question

**Question:** Which Security+ concept helps organizations choose controls based on likelihood and impact?

A) Risk management
B) Password sharing
C) Disabling logs
D) Ignoring vulnerabilities

**Correct answer:** A

**Explanation:** Risk management helps prioritize controls based on business impact and threat likelihood.

---

## Microsoft warns of surge in ACR Stealer attacks on customers

**Source:** BleepingComputer

**Published:** Sat, 18 Jul 2026 10:17:19 -0400

**Link:** https://www.bleepingcomputer.com/news/security/microsoft-warns-of-surge-in-acr-stealer-attacks-on-customers/

**Relevance:** High

**Reason:** This article highlights the growing threat of ACR Stealer malware, which is a significant concern for enterprise customers. The article discusses how attackers are using this malware to steal sensitive information from Microsoft's customers, and provides insights into the delivery methods used by the threat actor. Understanding these threats is crucial for cybersecurity learners as it helps them stay informed about emerging security risks.

**Summary:**
- **Bullet 1:** ACR Stealer attacks have surged in recent months, with attackers using ClickFix social-engineering techniques to deliver malware via WebDAV servers and MSHTA utility.
- **Bullet 2:** The threat actor uses a GUID-based directory structure and filenames to mimic legitimate resources, blending the activity with expected network traffic. This makes it harder for security measures to detect the malicious payload.
- **Bullet 3:** For the second delivery chain, attackers use ClickFix to launch MSHTA, which retrieves malicious content from an attacker's server and executes an obfuscated PowerShell downloader.

**Security+ domain:**
- **Key terms:** ACR Stealer, WebDAV, MSHTA, C2 infrastructure, persistence, Python loader, scheduled task, public blockchain services.
- **Defensive lesson:** Stay vigilant against social-engineering attacks and be aware of the potential for attackers to use legitimate-looking resources to deliver malicious payloads.

### Security+ Practice Question

**Question:** Which action best helps an organization recover from ransomware?

A) Paying the ransom immediately
B) Maintaining tested offline backups
C) Disabling all monitoring tools
D) Sharing privileged credentials

**Correct answer:** B

**Explanation:** Tested offline backups allow recovery without relying on the attacker.

---

## WordPress Core "wp2shell" RCE flaws get public exploits, patch now

**Source:** BleepingComputer

**Published:** Sat, 18 Jul 2026 13:22:47 -0400

**Link:** https://www.bleepingcomputer.com/news/security/wordpress-core-wp2shell-rce-flaws-get-public-exploits-patch-now/

**Relevance: High**

**Reason:** The "wp2shell" RCE flaws in WordPress Core are critical vulnerabilities that allow remote code execution without authentication, impacting more than 500 million websites. Immediate patching is essential to prevent potential exploitation and mitigate the risk of unauthorized access.

---

**Summary:**
- Bullet 1: Public exploits for critical "wp2shell" Remote Code Execution (RCE) flaws affecting WordPress Core.
- Bullet 2: Chained vulnerabilities CVE-2026-63030 and CVE-2026-60137 in versions 6.9.x and 7.0.x, enabling pre-authentication RCE against default installations.
- Bullet 3: WordPress security team has enabled forced automatic updates for affected sites; immediate patching is recommended to update to WordPress 7.0.2 or 6.9.5.

**Security+ Domain: Threats, Vulnerabilities, and Mitigations**

**Key Terms:**
- Term 1: Remote Code Execution (RCE)
- Term 2: Chained Flaws
- Term 3: Pre-authentication

**Defensive Lesson:**
- **Practical Defensive Takeaway:** Implement multi-layered security measures such as regular updates, strong authentication protocols, and comprehensive vulnerability scanning to protect against similar RCE vulnerabilities.

### Security+ Practice Question

**Question:** After a critical vulnerability is announced, what should defenders do first?

A) Ignore it until exploitation is confirmed
B) Assess exposure and prioritize remediation based on risk
C) Disable all network access permanently
D) Delete all logs

**Correct answer:** B

**Explanation:** Security+ emphasizes risk-based vulnerability management.

---

## Update now: 7-Zip fixes RCE flaw exploitable with malicious archives

**Source:** BleepingComputer

**Published:** Sat, 18 Jul 2026 15:32:02 -0400

**Link:** https://www.bleepingcomputer.com/news/security/update-now-7-zip-fixes-rce-flaw-exploitable-with-malicious-archives/

Relevance: High

Reason: This article highlights a critical security flaw in 7-Zip, which is one of the most widely used archive utilities on Windows. Exploiting this vulnerability could lead to remote code execution, allowing attackers to execute malicious code without user interaction. Given that 7-Zip's users are often unaware of potential threats and may not regularly update their software, this flaw poses a significant risk for cybersecurity learners.

Summary:
- The 7-Zip vulnerability in version 26.02 allows attackers to exploit specially crafted compressed files by convincing users to open them.
- This is the first time such a vulnerability has been disclosed, indicating it could be an attractive target for threat actors.
- Users must manually download and install the updated version from 7-zip.org to mitigate this risk.

Security+ domain: Threats, Vulnerabilities, and Mitigations

Key terms:
- Remote Code Execution (RCE)
- Heap-Based Buffer Overflow
- User Interaction Required

Defensive lesson:
- Regularly update software to patch known vulnerabilities.

### Security+ Practice Question

**Question:** Which control best reduces the risk of successful phishing attacks?

A) Disabling audit logs
B) Security awareness training and MFA
C) Using shared administrator accounts
D) Removing endpoint protection

**Correct answer:** B

**Explanation:** Security awareness training helps users identify phishing, while MFA reduces the impact of stolen credentials.

---


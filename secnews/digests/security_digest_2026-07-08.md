# Cybersecurity + Security+ Digest - 2026-07-08

## Microsoft to enable Windows settings backup by default for orgs

**Source:** BleepingComputer

**Published:** Tue, 07 Jul 2026 05:41:19 -0400

**Link:** https://www.bleepingcomputer.com/news/microsoft/microsoft-to-enable-windows-backup-for-organizations-by-default/

**Relevance: High**

**Reason:** This article directly impacts cybersecurity by highlighting the default enablement of Windows settings backup, which is crucial for maintaining user data integrity and preventing unauthorized access. Understanding how to configure and manage such features effectively is essential in protecting sensitive information.

### Summary:
- **Bullet 1**: Microsoft will enable the Windows settings backup tool by default on Windows 11 26H2 systems.
- **Bullet 2**: This feature helps ensure that enterprise users' settings are backed up automatically after device resets, upgrades, or reimaging.
- **Bullet 3**: IT administrators must configure policy settings to enable this feature and can disable it through MDM solutions.

### Security+ Domain:
**Key terms:**
- Windows
- Settings Backup Tool
- Default Behavior

### Defensive Lesson:
- Ensure that the backup tool is configured correctly for optimal security practices.
- Regularly review and update policies to maintain compliance with organizational needs.

### Security+ Practice Question

**Question:** Which Security+ concept helps organizations choose controls based on likelihood and impact?

A) Risk management
B) Password sharing
C) Disabling logs
D) Ignoring vulnerabilities

**Correct answer:** A

**Explanation:** Risk management helps prioritize controls based on business impact and threat likelihood.

---

## New Januscape Linux flaw allows VM escape on Intel, AMD devices

**Source:** BleepingComputer

**Published:** Tue, 07 Jul 2026 08:06:09 -0400

**Link:** https://www.bleepingcomputer.com/news/linux/new-januscape-linux-kernel-flaw-allows-vm-escape-on-intel-amd-devices/

Relevance: High

Reason:
This article highlights a critical security flaw in the Linux kernel that allows attackers to escape from a virtual machine and execute arbitrary code on the host, posing a significant risk to multi-tenant cloud environments. The vulnerability has been present for 16 years and was exploited by Google in their CTF program, demonstrating its potential impact.

Summary:
- Januscape is a guest-to-host exploit flaw in the Linux kernel that allows attackers with root access inside a virtual machine to execute code as root on the host.
- This flaw can cause DoS attacks or take over all guests running on the same physical machine, affecting multi-tenant public cloud environments like Google Cloud and Amazon Web Services.
- The vulnerability is present in both Intel and AMD processor architectures.

Security+ domain: Threats, Vulnerabilities, and Mitigations

Key terms:
- Januscape
- KVM/x86
- Shadow MMU emulation
- CVE-2026-53359

Defensive lesson:
Ensure that guest VMs are isolated from the host OS to prevent such vulnerabilities. Use secure boot mechanisms and regular kernel updates to mitigate this risk.

### Security+ Practice Question

**Question:** After a critical vulnerability is announced, what should defenders do first?

A) Ignore it until exploitation is confirmed
B) Assess exposure and prioritize remediation based on risk
C) Disable all network access permanently
D) Delete all logs

**Correct answer:** B

**Explanation:** Security+ emphasizes risk-based vulnerability management.

---

## Webinar tomorrow: Why modern email attacks require a new approach to defense

**Source:** BleepingComputer

**Published:** Tue, 07 Jul 2026 08:12:20 -0400

**Link:** https://www.bleepingcomputer.com/news/security/webinar-tomorrow-why-modern-email-attacks-require-a-new-approach-to-defense/

Relevance: High

Reason: The article highlights the evolving nature of email attacks that exploit legitimate identities and normal business communications, which is crucial for understanding modern cybersecurity threats. This relevance is high because it directly impacts the security practices and strategies discussed in CompTIA Security+ exams.

Summary:
- Modern email attacks are increasingly relying on trusted identities and legitimate services.
- Traditional email security controls are ineffective against these sophisticated techniques.
- Behavioral AI can help identify abnormal communication patterns, automate investigations, and improve response efforts.

Security+ domain: General Security Concepts

Key terms:
- Device Code phishing
- Trusted sender impersonation
- Business Email Compromise (BEC)
- Account takeover (ATO)

Defensive lesson:
- Implement behavioral AI to detect and respond to sophisticated email attacks more effectively.

### Security+ Practice Question

**Question:** Which control best reduces the risk of successful phishing attacks?

A) Disabling audit logs
B) Security awareness training and MFA
C) Using shared administrator accounts
D) Removing endpoint protection

**Correct answer:** B

**Explanation:** Security awareness training helps users identify phishing, while MFA reduces the impact of stolen credentials.

---

## The GitHub Actions Attack Pattern Your CI Security Scanners Miss

**Source:** BleepingComputer

**Published:** Tue, 07 Jul 2026 10:01:11 -0400

**Link:** https://www.bleepingcomputer.com/news/security/the-github-actions-attack-pattern-your-ci-security-scanners-miss/

**Relevance: High**

**Reason:** This article highlights the significant gap in current security practices, specifically with CI/CD (Continuous Integration/Continuous Deployment) pipelines. The use of GitHub Actions workflows is often overlooked by scanners due to their green status, leading to vulnerabilities that can be exploited without proper detection.

**Summary:**
- **Bullet 1:** GitHub Actions workflows are triggered by pull_request and run in an untrusted context.
- **Bullet 2:** An attacker can induce commands and code injection through these workflows.
- **Bullet 3:** Cross-workflow privilege escalation allows low-privilege workflows to escalate privileges, leading to potential data manipulation.

**Security+ Domain: Threats, Vulnerabilities, and Mitigations**

**Key Terms:**
- Command Injection
- Code Injection
- Privilege Escalation

**Defensive Lesson:**
- Ensure that all CI/CD pipelines are thoroughly tested for security vulnerabilities.
- Implement strict access controls and monitoring to detect and prevent unauthorized actions.

### Security+ Practice Question

**Question:** Which control best reduces the risk of successful phishing attacks?

A) Disabling audit logs
B) Security awareness training and MFA
C) Using shared administrator accounts
D) Removing endpoint protection

**Correct answer:** B

**Explanation:** Security awareness training helps users identify phishing, while MFA reduces the impact of stolen credentials.

---

## Spain arrests suspected member of pro-Russian hacktivist groups

**Source:** BleepingComputer

**Published:** Tue, 07 Jul 2026 11:21:21 -0400

**Link:** https://www.bleepingcomputer.com/news/security/spain-arrests-suspected-member-of-pro-russian-hacktivist-groups/

**Relevance: High**

**Reason:** This article highlights the connection between pro-Russian hacktivist groups and cyberattacks targeting critical infrastructure, which is directly relevant to cybersecurity learners. Understanding these groups' activities can help in recognizing potential threats and developing strategies to protect against them.

**Summary:**
- **Bullet 1:** Spain arrests a suspected member of CARR and Z-Pentest, two pro-Russian hacktivist groups.
- **Bullet 2:** The arrested individual provided logistical support to a Ukrainian hacker for these groups.
- **Bullet 3:** The group has been linked to attacks on water and food-processing facilities in the U.S., posing real safety risks.

**Security+ Domain: Threats, Vulnerabilities, and Mitigations**

**Key Terms:**
- Pro-Russian Hacktivist Groups
- CyberArmy of Russia Reborn (CARR)
- Z-Pentest
- SCADA Systems

**Defensive Lesson:**
- Recognize the threat posed by pro-Russian hacktivist groups.
- Understand the importance of cybersecurity awareness and training.

### Security+ Practice Question

**Question:** Which action best helps an organization recover from ransomware?

A) Paying the ransom immediately
B) Maintaining tested offline backups
C) Disabling all monitoring tools
D) Sharing privileged credentials

**Correct answer:** B

**Explanation:** Tested offline backups allow recovery without relying on the attacker.

---

## Hidden backdoor in Tenda router firmware grants admin access

**Source:** BleepingComputer

**Published:** Tue, 07 Jul 2026 13:27:22 -0400

**Link:** https://www.bleepingcomputer.com/news/security/hidden-backdoor-in-tenda-router-firmware-grants-admin-access/

**Relevance: High**

**Reason:** This issue highlights the importance of patch management and security updates, as well as the need for thorough security testing and vulnerability scanning. It demonstrates how even seemingly secure devices can have vulnerabilities that attackers could exploit.

**Summary:**
1. A hidden authentication backdoor has been found in multiple Tenda router firmware versions.
2. The mechanism allows an attacker to gain administrative access through a username/password combination, bypassing standard authentication methods.
3. This issue remains unfixed due to the Chinese maker of the routers not being reached for updates.

**Security+ Domain: Threats, Vulnerabilities, and Mitigations**

**Key Terms:**
- Authentication
- Backdoor
- MD5-based authentication

**Defensive Lesson:**
Implement regular security audits and vulnerability assessments. Stay informed about firmware updates and patch management practices to prevent such vulnerabilities from being exploited.

### Security+ Practice Question

**Question:** Which control best reduces the risk of successful phishing attacks?

A) Disabling audit logs
B) Security awareness training and MFA
C) Using shared administrator accounts
D) Removing endpoint protection

**Correct answer:** B

**Explanation:** Security awareness training helps users identify phishing, while MFA reduces the impact of stolen credentials.

---

## Chinese hackers develop LONGLEASH malware to expand ORB network

**Source:** BleepingComputer

**Published:** Tue, 07 Jul 2026 14:52:19 -0400

**Link:** https://www.bleepingcomputer.com/news/security/chinese-hackers-develop-longleash-malware-to-expand-orb-network/

**Relevance: High**

**Reason:** This article highlights the evolving sophistication of Chinese cyber threats, specifically targeting Ruckus routers and expanding their operational relay box (ORB) network. The discovery of new malware like LONGLEASH underscores the ongoing threat landscape and the need for advanced security measures to detect and mitigate these sophisticated attacks.

**Summary:**
- **Bullet 1:** Chinese hackers are actively developing new malware, including LONGLEASH, to expand their ORB network.
- **Bullet 2:** The malware is targeting unpatched Ruckus routers, exploiting known vulnerabilities like CVE-2020-22653 and CVE-2020-22658.
- **Bullet 3:** Talos researchers have identified new capabilities in the LONGLEASH malware, such as reverse shell functionality, HTTP proxying, and TLS support.

**Security+ Domain: Threats, Vulnerabilities, and Mitigations**

**Key Terms:**
- Ruckus routers
- Longleash malware
- Shortleash backdoor

**Defensive Lesson:**
- Implement regular updates and patches for all network devices.
- Use strong authentication methods to prevent unauthorized access.
- Employ advanced threat detection systems capable of identifying new variants of known threats.

### Security+ Practice Question

**Question:** After a critical vulnerability is announced, what should defenders do first?

A) Ignore it until exploitation is confirmed
B) Assess exposure and prioritize remediation based on risk
C) Disable all network access permanently
D) Delete all logs

**Correct answer:** B

**Explanation:** Security+ emphasizes risk-based vulnerability management.

---

## Accenture confirms breach after hacker offers stolen data for sale

**Source:** BleepingComputer

**Published:** Tue, 07 Jul 2026 18:06:07 -0400

**Link:** https://www.bleepingcomputer.com/news/security/accenture-confirms-breach-after-hacker-offers-stolen-data-for-sale/

**Relevance: High**

This article is highly relevant for cybersecurity learners because it discusses a real-world incident involving a major global IT services company, Accenture. The breach highlights several key cybersecurity issues:

1. **Data Exposure**: The theft of 35 GB of data from Accenture underscores the risk of sensitive information being exposed to unauthorized parties.
2. **Threat Actor's Tactics**: The threat actor’s method of claiming responsibility and selling stolen data on a cybercrime forum demonstrates sophisticated attack techniques that could be used against other organizations.
3. **Lack of Transparency**: The fact that Accenture did not comment on the extent or nature of the breach, despite acknowledging it, shows a lack of transparency in handling security incidents.

**Security+ Domain: Threats, Vulnerabilities, and Mitigations**

- **Threat Actor's Tactics**: Understanding how threat actors operate is crucial for identifying potential vulnerabilities.
- **Lack of Transparency**: The incident highlights the importance of clear communication and transparency when dealing with security breaches to prevent further damage.

**Key Terms:**
- Data Breach
- Cybercrime Forum
- Azure DevOps Repository

**Defensive Lesson:**
- Implement strong access controls and monitoring systems to detect and respond quickly to potential threats.
- Conduct regular security audits and vulnerability assessments to identify and mitigate risks.

### Security+ Practice Question

**Question:** Which action best helps an organization recover from ransomware?

A) Paying the ransom immediately
B) Maintaining tested offline backups
C) Disabling all monitoring tools
D) Sharing privileged credentials

**Correct answer:** B

**Explanation:** Tested offline backups allow recovery without relying on the attacker.

---


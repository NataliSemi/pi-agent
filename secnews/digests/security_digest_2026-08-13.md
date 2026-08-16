# Cybersecurity + Security+ Digest - 2026-08-13

## Microsoft Plugs Nearly 400 Security Holes

**Source:** Krebs on Security

**Published:** Tue, 11 Aug 2026 21:28:35 +0000

**Link:** https://krebsonsecurity.com/2026/08/microsoft-plugs-nearly-400-security-holes/

**Relevance: High**

**Reason:** This article highlights the significant number of security vulnerabilities patched by Microsoft, which is crucial for cybersecurity learners as it demonstrates the importance of timely updates and patch management. The high number of patches (398 out of 570) indicates a proactive approach to addressing known risks.

**Summary:**
- **Bullet 1:** Microsoft released updates to fix over 400 security vulnerabilities in its Windows operating systems.
- **Bullet 2:** One vulnerability, CVE-2026-68820, is rated critical due to severe exploitation potential.
- **Bullet 3:** The article emphasizes the need for users to expect frequent patching on Tuesday.

**Security+ domain:**
- **Key terms:**
  - Vulnerabilities
  - Patch management
  - Artificial intelligence

- **Defensive lesson:**
  - Users should regularly update their systems and keep security patches up-to-date.

### Security+ Practice Question

**Question:** After a critical vulnerability is announced, what should defenders do first?

A) Ignore it until exploitation is confirmed
B) Assess exposure and prioritize remediation based on risk
C) Disable all network access permanently
D) Delete all logs

**Correct answer:** B

**Explanation:** Security+ emphasizes risk-based vulnerability management.

---

## The Threat Hiding in Your Hiring Process: How Fake Remote Workers Get In

**Source:** BleepingComputer

**Published:** Wed, 12 Aug 2026 10:01:11 -0400

**Link:** https://www.bleepingcomputer.com/news/security/the-threat-hiding-in-your-hiring-process-how-fake-remote-workers-get-in/

**Relevance: High**

**Reason:** This article highlights the critical gap in cybersecurity between verifying identity and ensuring access legitimacy, which is crucial for security teams. The threat of fake remote workers compromising corporate networks through phishing emails or exploiting vulnerabilities during the hiring process underscores a significant vulnerability that must be addressed.

- **Bullet 1**: Fake remote workers can impersonate legitimate candidates using forged credentials and AI-generated profiles to gain employment.
- **Bullet 2**: Once employed, these workers may steal sensitive data by copying source-code repositories, exfiltrating proprietary information, or supporting cybercriminal activities.
- **Bullet 3**: After being discovered or dismissed, some fake workers threaten employers with the stolen code and data, further complicating the verification process.

**Security+ domain: Threats, Vulnerabilities, and Mitigations**

**Key terms:**
- Phishing
- Identity theft
- Proxy registration
- AI-generated profiles

**Defensive lesson:**
- Implement multi-factor authentication (MFA) for all remote access.
- Conduct thorough background checks on candidates before hiring.
- Use identity verification tools to confirm the authenticity of resumes and job applications.
- Regularly update security protocols to prevent exploitation through fake credentials.

### Security+ Practice Question

**Question:** Which control best reduces the risk of successful phishing attacks?

A) Disabling audit logs
B) Security awareness training and MFA
C) Using shared administrator accounts
D) Removing endpoint protection

**Correct answer:** B

**Explanation:** Security awareness training helps users identify phishing, while MFA reduces the impact of stolen credentials.

---

## FBI: Hackers target online accounts to steal nude photos

**Source:** BleepingComputer

**Published:** Wed, 12 Aug 2026 10:15:09 -0400

**Link:** https://www.bleepingcomputer.com/news/security/fbi-warns-of-hackers-targeting-online-accounts-to-steal-explicit-photos/

**Relevance: High**

**Reason:** This article highlights the significant threat of cybercriminals targeting individuals' online accounts for sexual exploitation, including blackmail and sextortion. Understanding these threats is crucial for cybersecurity learners as they prepare to protect themselves from such attacks.

### Summary:

- **Bullet 1**: Cybercriminals are using stolen sexually explicit images or videos to blackmail victims or sell them on criminal marketplaces.
  
- **Bullet 2**: Victims' personal information, including names and contact details, may be shared with other criminals for further harassment or extortion.

- **Bullet 3**: The FBI warns that once the content is stolen, cybercriminals post it on marketplaces without the victims’ knowledge, leading to re-victimization through targeted attacks like stalking or advertising explicit images online.

### Security+ Domain:
**Threats, Vulnerabilities, and Mitigations**

### Key Terms:
- **Term 1**: Cybercrime
- **Term 2**: Sextortion
- **Term 3**: Personal Information Leakage

### Defensive Lesson:
- Do not reply to text messages or emails asking for verification codes or click password reset links.
- Store explicit photos or videos on non-internet-accessible sites.

### Security+ Practice Question

**Question:** Which action best helps an organization recover from ransomware?

A) Paying the ransom immediately
B) Maintaining tested offline backups
C) Disabling all monitoring tools
D) Sharing privileged credentials

**Correct answer:** B

**Explanation:** Tested offline backups allow recovery without relying on the attacker.

---

## Lazarus hackers exploited Windows zero-day to target defense firms

**Source:** BleepingComputer

**Published:** Wed, 12 Aug 2026 11:38:08 -0400

**Link:** https://www.bleepingcomputer.com/news/security/lazarus-hackers-exploited-windows-zero-day-to-target-defense-firms/

**Relevance: High**

**Reason:** This article highlights the exploitation of a critical Windows zero-day vulnerability by North Korean hackers, Lazarus, targeting defense-sector companies. The vulnerability allows attackers to escalate privileges and install malware, which is significant for cybersecurity learners as it demonstrates the ongoing threat landscape and the need for continuous security updates and patch management.

---

**Security+ Domain: Threats, Vulnerabilities, and Mitigations**

- **Threat:** Windows zero-day exploit by Lazarus hackers.
- **Vulnerability:** CVE-2026-68820 in AFD.sys.
- **Mitigation:** Patching vulnerabilities like this is crucial for mitigating the risk of exploitation.

---

**Key Terms:**
- Term 1: Windows zero-day vulnerability
- Term 2: Lazarus hackers
- Term 3: CVE-2026-68820

**Defensive Lesson:**
- **Practical Takeaway:** Stay vigilant and regularly update software to patch known vulnerabilities.

### Security+ Practice Question

**Question:** Which control best reduces the risk of successful phishing attacks?

A) Disabling audit logs
B) Security awareness training and MFA
C) Using shared administrator accounts
D) Removing endpoint protection

**Correct answer:** B

**Explanation:** Security awareness training helps users identify phishing, while MFA reduces the impact of stolen credentials.

---

## Plug and Pwn attack uses fake USB devices for Windows SYSTEM access

**Source:** BleepingComputer

**Published:** Wed, 12 Aug 2026 12:05:12 -0400

**Link:** https://www.bleepingcomputer.com/news/security/plug-and-pwn-attack-uses-fake-usb-devices-for-windows-system-access/

**Relevance: High**

**Reason:** This article highlights a significant vulnerability in Windows' Plug and Play feature, which can be exploited to gain SYSTEM privileges without user interaction or physical hardware connection. The research demonstrates how attackers can use software emulations of USB devices to trigger the installation of vulnerable vendor packages, potentially leading to unauthorized access.

**Summary:**
- **Bullet 1:** Researchers have discovered a new "Plug and Pwn" attack that abuses Windows' Plug and Play feature.
- **Bullet 2:** The attack exploits how Windows automatically identifies new hardware, locates matching driver packages, and installs vendor software as SYSTEM.
- **Bullet 3:** By emulating USB devices, attackers can force Windows to install signed but potentially exploitable vendor packages.

**Security+ domain: Threats, Vulnerabilities, and Mitigations**

**Key terms:**
- Plug and Play
- Co-installers
- SYSTEM privileges

**Defensive lesson:**
- Educate users on the importance of enabling UAC (User Account Control) to prevent unauthorized access.

### Security+ Practice Question

**Question:** After a critical vulnerability is announced, what should defenders do first?

A) Ignore it until exploitation is confirmed
B) Assess exposure and prioritize remediation based on risk
C) Disable all network access permanently
D) Delete all logs

**Correct answer:** B

**Explanation:** Security+ emphasizes risk-based vulnerability management.

---

## Hundreds of fake Chrome VPN extensions route traffic through a proxy

**Source:** BleepingComputer

**Published:** Wed, 12 Aug 2026 14:54:57 -0400

**Link:** https://www.bleepingcomputer.com/news/security/hundreds-of-fake-chrome-vpn-extensions-route-traffic-through-a-proxy/

**Relevance: High**

This article is highly relevant for cybersecurity learners because it highlights the significant risks of fake and impersonated software, often referred to as "zombie" or "bot" extensions. These extensions can route users' traffic through malicious proxies operated by a single provider, potentially exposing them to man-in-the-middle attacks, data interception, and other security threats.

**Reason:**
The article demonstrates the practical impact of fake software on user privacy and security, showing how these impersonated extensions can be used to funnel customers to subscription-based services in Russia. This highlights the importance of recognizing and avoiding such deceptive practices that could compromise users' online activities and data protection.

**Summary:**

- **Bullet 1:** The campaign relied on 40 publisher accounts and a shared analytics account, with nearly 75,000 downloads from Russian users seeking to bypass blocked services.
  
- **Bullet 2:** Extensions impersonated well-known brands like Proton VPN, NordVPN, Surfshark, ExpressVPN, and Cloudflare’s DNS resolver. Some extensions advertised non-existent premium servers in Japan, Singapore, Canada, Australia, and Turkey for subscription fraud.

- **Bullet 3:** The campaign used 520 extensions to route all browser traffic through the operator's SOCKS5 proxies on port 1082, while 104 resolved proxy hostnames through Cloudflare or Google DNS-over-HTTPS. These extensions were downloaded by Russian users looking for tools to bypass blocked services.

**Security+ Domain: Threats, Vulnerabilities, and Mitigations**

**Key Terms:**
- Impersonated software
- Proxy routing
- Man-in-the-middle attacks

**Defensive Lesson:**
Recogn

### Security+ Practice Question

**Question:** Which Security+ concept helps organizations choose controls based on likelihood and impact?

A) Risk management
B) Password sharing
C) Disabling logs
D) Ignoring vulnerabilities

**Correct answer:** A

**Explanation:** Risk management helps prioritize controls based on business impact and threat likelihood.

---

## Hackers exploit critical Adobe Commerce flaw to hijack customer accounts

**Source:** BleepingComputer

**Published:** Wed, 12 Aug 2026 16:54:59 -0400

**Link:** https://www.bleepingcomputer.com/news/security/hackers-exploit-critical-adobe-commerce-flaw-to-hijack-customer-accounts/

Relevance: High

Reason: This article highlights a critical vulnerability in Adobe's e-commerce platforms that could allow attackers to hijack customer accounts, demonstrating the importance of patching known vulnerabilities and staying informed about security threats.

Summary:
1. A critical vulnerability (CVE-2026-71362) has been exploited by hackers on Adobe Commerce and Magento platforms.
2. The flaw is described as an incorrect authorization vulnerability that could be leveraged to gain elevated access without authentication, potentially allowing attackers to hijack customer accounts.
3. Although Adobe states it is unaware of exploits in the wild for any of the fixed flaws, eCommerce security company Sansec's Shield web application firewall is blocking CVE-2026-71362 exploitation attempts.

Security+ domain: Threats, Vulnerabilities, and Mitigations

Key terms:
- Incorrect authorization vulnerability
- Customer account hijacking
- Cross-site scripting (XSS)

Defensive lesson:
Implementing security patches and staying informed about known vulnerabilities is crucial for preventing unauthorized access to customer accounts.

### Security+ Practice Question

**Question:** After a critical vulnerability is announced, what should defenders do first?

A) Ignore it until exploitation is confirmed
B) Assess exposure and prioritize remediation based on risk
C) Disable all network access permanently
D) Delete all logs

**Correct answer:** B

**Explanation:** Security+ emphasizes risk-based vulnerability management.

---

## Android malware combo takes out loans and relays victims' credit cards

**Source:** BleepingComputer

**Published:** Wed, 12 Aug 2026 18:22:57 -0400

**Link:** https://www.bleepingcomputer.com/news/security/android-malware-combo-takes-out-loans-and-relays-victims-credit-cards/

**Relevance: High**

**Reason:** This article highlights the growing threat of Android malware, specifically focusing on the combination of SpyNote and WindRelay that can steal card data and relay it in real time. The incident described demonstrates how attackers can use social engineering to gain remote access through a legitimate app, install malicious software without user interaction, and then execute fraudulent activities such as taking out loans and using stolen credit cards.

**Summary:**
- **Bullet 1:** A new Android malware called WindRelay is being used in conjunction with SpyNote to steal card data.
- **Bullet 2:** The attacker impersonated a bank employee by calling the victim, instructing them to sideload the app disguised as legitimate and grant it Accessibility Service permissions. This allowed remote access to their device.
- **Bullet 3:** Once on the device, the attacker installed WindRelay without further interaction, enabling them to use the banking app to take out a loan in the victim’s name.

**Security+ Domain: Threats, Vulnerabilities, and Mitigations**

**Key Terms:**
- SpyNote
- WindRelay
- Accessibility Service permissions

**Defensive Lesson:**
- **Practical Defensive Takeaway:** Be cautious of legitimate-looking apps that ask for unnecessary permissions. Always verify the source of an app before granting it access to your device.

### Security+ Practice Question

**Question:** Which control best reduces the risk of successful phishing attacks?

A) Disabling audit logs
B) Security awareness training and MFA
C) Using shared administrator accounts
D) Removing endpoint protection

**Correct answer:** B

**Explanation:** Security awareness training helps users identify phishing, while MFA reduces the impact of stolen credentials.

---

## "City-Forum" data-theft attacks target Salesforce, ServiceNow portals

**Source:** BleepingComputer

**Published:** Wed, 12 Aug 2026 19:07:23 -0400

**Link:** https://www.bleepingcomputer.com/news/security/city-forum-data-theft-attacks-target-salesforce-servicenow-portals/

**Relevance: High**

**Reason:** This article highlights a significant security vulnerability in the way organizations manage their Salesforce and ServiceNow portals, which could lead to unauthorized access and data theft. The use of guest accounts for unauthenticated users is a common practice that can expose sensitive information without proper controls.

**Summary:**
- **Bullet 1:** Custom tools are being used by an ongoing data theft campaign targeting Salesforce and ServiceNow environments.
- **Bullet 2:** The attacks originate from the IP address 158.220.87.79, hosted by Contabo in Germany, indicating a persistent threat infrastructure.
- **Bullet 3:** Organizations have mistakenly exposed their sensitive data to unauthenticated users through overly permissive sharing rules or portal configurations.

**Security+ Domain: Threats, Vulnerabilities, and Mitigations**

**Key Terms:**
- IP address
- Go-http-client/1.1 user agent
- Guest accounts

**Defensive Lesson:**
- Implement proper access controls to prevent unauthorized guest users from accessing sensitive data.
- Regularly review and update sharing rules and permissions in Salesforce and ServiceNow to ensure they are secure and compliant with best practices.

### Security+ Practice Question

**Question:** After a critical vulnerability is announced, what should defenders do first?

A) Ignore it until exploitation is confirmed
B) Assess exposure and prioritize remediation based on risk
C) Disable all network access permanently
D) Delete all logs

**Correct answer:** B

**Explanation:** Security+ emphasizes risk-based vulnerability management.

---


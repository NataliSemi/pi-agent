# Cybersecurity + Security+ Digest - 2026-07-21

## Hugging Face warns an autonomous AI agent hacked its network

**Source:** BleepingComputer

**Published:** Mon, 20 Jul 2026 07:56:28 -0400

**Link:** https://www.bleepingcomputer.com/news/security/hugging-face-breach-autonomous-ai-agent-system-internal-datasets-credentials/

**Relevance: High**

**Reason:** This article highlights the potential for autonomous AI agents to be used in cyberattacks, which is a significant concern for cybersecurity learners. The incident demonstrates how attackers can leverage vulnerabilities within AI systems to gain unauthorized access and perform malicious actions.

**Summary:**
- Hugging Face's production infrastructure was breached using an autonomous AI agent system.
- Attackers exploited two code-execution vulnerabilities to steal cloud credentials and move laterally across internal clusters.
- The breach involved a swarm of short-lived sandboxes, indicating the use of an agentic security-research harness.
- Hugging Face has taken steps to close vulnerable paths, evict the attacker, rebuild compromised nodes, and improve malicious activity detection systems.

**Security+ domain: 2. Threats, Vulnerabilities, and Mitigations**

**Key terms:**
- Autonomous AI agent
- Code-execution vulnerabilities
- Cloud credentials

**Defensive lesson:**
- Implement robust security measures to prevent unauthorized access through autonomous agents.
- Regularly update software and patch vulnerabilities promptly.

### Security+ Practice Question

**Question:** Which control best reduces the risk of successful phishing attacks?

A) Disabling audit logs
B) Security awareness training and MFA
C) Using shared administrator accounts
D) Removing endpoint protection

**Correct answer:** B

**Explanation:** Security awareness training helps users identify phishing, while MFA reduces the impact of stolen credentials.

---

## An AI SOC Evaluation Guide for Security Leaders

**Source:** BleepingComputer

**Published:** Mon, 20 Jul 2026 10:01:11 -0400

**Link:** https://www.bleepingcomputer.com/news/security/an-ai-soc-evaluation-guide-for-security-leaders/

**Relevance: High**

**Reason:** This article is highly relevant for cybersecurity learners as it addresses the critical issue of evaluating and deploying AI in Security Operations Centers (SOCs). It provides valuable insights into why many AI SOC projects fail in production, offering a practical guide to help security leaders bridge this gap.

**Summary:**
- **Bullet 1:** The market for AI in SOC is rapidly growing but often fails to deliver as expected.
- **Bullet 2:** Gartner’s “Hype Cycle” shows that most AI SOC solutions are not ready for production.
- **Bullet 3:** A practical guide from Prophet Security helps security leaders evaluate and select the right AI SOC tools.

**Security+ Domain:**
- **Key Terms:**
  - AI
  - SOC
  - Gartner Hype Cycle

**Defensive Lesson:**
- **Practical Takeaway:** Start by clearly defining what you expect a proof of concept to achieve before investing time and resources. This ensures that the evaluation is focused on meaningful outcomes rather than just flashy features.

This summary encapsulates the main points of the article in bullet form, highlighting its relevance for cybersecurity learners and providing practical advice.

### Security+ Practice Question

**Question:** Which Security+ concept helps organizations choose controls based on likelihood and impact?

A) Risk management
B) Password sharing
C) Disabling logs
D) Ignoring vulnerabilities

**Correct answer:** A

**Explanation:** Risk management helps prioritize controls based on business impact and threat likelihood.

---

## New HollowGraph malware uses Microsoft Graph for stealthy C2 comms

**Source:** BleepingComputer

**Published:** Mon, 20 Jul 2026 13:43:01 -0400

**Link:** https://www.bleepingcomputer.com/news/security/new-hollowgraph-malware-uses-microsoft-graph-for-stealthy-c2-comms/

**Relevance: High**

**Reason:** The HollowGraph malware uses the calendar feature in compromised Microsoft 365 mailboxes as a command-and-control channel, which is highly relevant for cybersecurity learners. This method of communication bypasses traditional security measures and can be easily overlooked by defenders.

**Summary:**
- **Bullet 1:** Researchers have identified a new piece of malware called HollowGraph that uses the calendar feature in compromised Microsoft 365 mailboxes as its command-and-control channel.
- **Bullet 2:** The threat actor is targeting organizations in Israel, indicating a potential espionage attack. This suggests that cybersecurity measures should be strengthened to prevent such targeted attacks.
- **Bullet 3:** The malware supports two commands: GET for searching and decrypting instructions, and SEND for creating calendar entries with encrypted data.

**Security+ Domain: Threats, Vulnerabilities, and Mitigations**

**Key Terms:**
- HollowGraph
- Microsoft Graph API
- Command-and-Control (C2)
- RSA keys

**Defensive Lesson:**
- Implement multi-factor authentication to prevent unauthorized access to compromised accounts.
- Regularly update software and patch vulnerabilities promptly.

### Security+ Practice Question

**Question:** Which action best helps an organization recover from ransomware?

A) Paying the ransom immediately
B) Maintaining tested offline backups
C) Disabling all monitoring tools
D) Sharing privileged credentials

**Correct answer:** B

**Explanation:** Tested offline backups allow recovery without relying on the attacker.

---

## JadePuffer agentic attacks now target AI model data with ransomware

**Source:** BleepingComputer

**Published:** Mon, 20 Jul 2026 17:08:02 -0400

**Link:** https://www.bleepingcomputer.com/news/security/jadepuffer-agentic-attacks-now-target-ai-model-data-with-ransomware/

### Relevance: High

**Reason:** This article highlights the threat of AI and machine learning (ML) assets being targeted by ransomware, which is a significant concern for cybersecurity learners. The use of custom malware specifically designed to encrypt AI model data increases the complexity and potential impact of cyberattacks on critical infrastructure.

### Security+ Domain:
- **Threats, Vulnerabilities, and Mitigations**

**Key Terms:**
- JadePuffer
- EncForge ransomware

**Defensive Lesson:**
- Implement robust access controls and encryption for AI model data to prevent unauthorized access.
- Regularly update security software and patch vulnerabilities promptly.

### Security+ Practice Question

**Question:** Which control best reduces the risk of successful phishing attacks?

A) Disabling audit logs
B) Security awareness training and MFA
C) Using shared administrator accounts
D) Removing endpoint protection

**Correct answer:** B

**Explanation:** Security awareness training helps users identify phishing, while MFA reduces the impact of stolen credentials.

---

## Cursor, Codex, Gemini CLI, Antigravity hit by sandbox escapes

**Source:** BleepingComputer

**Published:** Mon, 20 Jul 2026 17:14:42 -0400

**Link:** https://www.bleepingcomputer.com/news/security/cursor-codex-gemini-cli-antigravity-hit-by-sandbox-escapes/

**Relevance: High**

**Reason:** This article highlights the vulnerabilities in sandboxed environments, which are critical for cybersecurity learners to understand. The research demonstrates how agents can escape sandboxes without directly attacking them, leading to potential security risks that could be exploited by attackers.

**Summary:**
- Pillar Security's researchers found ways to bypass sandboxes in four widely used AI tools.
- These findings show the limitations of sandboxed environments and highlight the importance of continuous monitoring and updates for security.
- The research categorizes the issues into denial-of-service, workspace configuration, command allowlists, and privileged local daemons.

**Security+ Domain:**
- **Threats, Vulnerabilities, and Mitigations**

**Key Terms:**
- Denial-of-Service (DoS)
- Workspace Configuration
- Command Allowlist

**Defensive Lesson:**
- Implement comprehensive security monitoring to detect and prevent unauthorized actions within sandboxed environments.

### Security+ Practice Question

**Question:** After a critical vulnerability is announced, what should defenders do first?

A) Ignore it until exploitation is confirmed
B) Assess exposure and prioritize remediation based on risk
C) Disable all network access permanently
D) Delete all logs

**Correct answer:** B

**Explanation:** Security+ emphasizes risk-based vulnerability management.

---

## Hackers steal $23.7 million in crypto from Ostium in off-chain attack

**Source:** BleepingComputer

**Published:** Mon, 20 Jul 2026 18:22:56 -0400

**Link:** https://www.bleepingcomputer.com/news/security/hackers-steal-237-million-in-crypto-from-ostium-in-off-chain-attack/

**Relevance: High**

**Reason:** This incident highlights the importance of securing off-chain infrastructure that feeds prices into decentralized finance (DeFi) platforms. The attacker manipulated legitimate price reports to steal funds from a liquidity provider, demonstrating how even seemingly secure systems can be exploited through vulnerabilities in their external dependencies.

---

**Summary:**
- **Bullet 1:** Ostium's $23.75 million theft was due to an off-chain attack on its price feeding system.
- **Bullet 2:** The attacker submitted fake price reports and rapidly opened and closed positions, generating artificial profits.
- **Bullet 3:** Collateral for traders remained unaffected, while existing positions were left open.

**Security+ domain: Threats, Vulnerabilities, and Mitigations**

**Key terms:**
- Off-chain infrastructure
- Price feeding system
- Fake price reports

**Defensive lesson:**
- Ensure all external dependencies are secure and regularly audited.

### Security+ Practice Question

**Question:** After a critical vulnerability is announced, what should defenders do first?

A) Ignore it until exploitation is confirmed
B) Assess exposure and prioritize remediation based on risk
C) Disable all network access permanently
D) Delete all logs

**Correct answer:** B

**Explanation:** Security+ emphasizes risk-based vulnerability management.

---

## SonicWall SMA1000 flaws exploited as zero-days to push custom malware

**Source:** BleepingComputer

**Published:** Mon, 20 Jul 2026 18:23:23 -0400

**Link:** https://www.bleepingcomputer.com/news/security/sonicwall-sma1000-flaws-exploited-as-zero-days-to-push-custom-malware/

**Relevance: High**

**Reason:** This article highlights the significant cybersecurity risks associated with outdated software and unpatched vulnerabilities, which are critical for learners to understand in their daily assessments.

**Summary:**
1. Two previously undisclosed SonicWall SMA1000 vulnerabilities were exploited by threat actors weeks after they were disclosed.
2. The flaws allowed custom malware installation on vulnerable devices.
3. Volexity detailed the full exploitation chain and how attackers compromised appliances, including zero-day exploits and specific threats targeting SonicWall products.

**Security+ Domain: Threats, Vulnerabilities, and Mitigations**

**Key Terms:**
- Server-side request forgery (SSRF)
- Command injection
- Zero-day exploit

**Defensive Lesson:**
- Regularly update software to close known vulnerabilities.
- Implement strong access controls and authentication mechanisms.

### Security+ Practice Question

**Question:** After a critical vulnerability is announced, what should defenders do first?

A) Ignore it until exploitation is confirmed
B) Assess exposure and prioritize remediation based on risk
C) Disable all network access permanently
D) Delete all logs

**Correct answer:** B

**Explanation:** Security+ emphasizes risk-based vulnerability management.

---

## Estée Lauder discloses data breach via Oracle E-Business flaw

**Source:** BleepingComputer

**Published:** Mon, 20 Jul 2026 18:39:30 -0400

**Link:** https://www.bleepingcomputer.com/news/security/est-e-lauder-discloses-data-breach-via-oracle-e-business-flaw/

**Relevance: High**

**Reason:** This article highlights a significant cybersecurity incident involving Oracle E-Business Suite, which is widely used by companies for HR management. The breach exposes personal information of individuals, including sensitive data like social security numbers and financial account details, making it highly relevant to cybersecurity learners.

**Summary:**
- **Bullet 1:** Estée Lauder notified customers about a data breach due to an Oracle E-Business Suite flaw exploited in August 2025.
- **Bullet 2:** The breach involved obtaining personal information of certain individuals, including full names, postal addresses, email addresses, dates of birth, and financial account details.
- **Bullet 3:** The incident correlates with a mass-exploitation campaign targeting Oracle E-Business Suite through CVE-2025-61882.

**Security+ Domain: Threats, Vulnerabilities, and Mitigations**

**Key Terms:**
- Oracle E-Business Suite
- CVE-2025-61882

**Defensive Lesson:**
- **Practical Defensive Takeaway:** Companies should regularly update their software to patch vulnerabilities like the one exploited in this incident.

### Security+ Practice Question

**Question:** Which action best helps an organization recover from ransomware?

A) Paying the ransom immediately
B) Maintaining tested offline backups
C) Disabling all monitoring tools
D) Sharing privileged credentials

**Correct answer:** B

**Explanation:** Tested offline backups allow recovery without relying on the attacker.

---


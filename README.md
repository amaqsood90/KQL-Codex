<div align="center">

# KQL-Codex

<img src="https://img.shields.io/badge/KQL-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white"/>
<img src="https://img.shields.io/badge/Microsoft_Sentinel-0078D4?style=for-the-badge&logo=microsoftsqlserver&logoColor=white"/>
<img src="https://img.shields.io/badge/Defender_XDR-00BCF2?style=for-the-badge&logo=microsoft&logoColor=white"/>
<img src="https://img.shields.io/badge/Entra_ID-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white"/>

<br/>

<img src="https://img.shields.io/badge/License-MIT-yellow?style=flat-square"/>
<img src="https://img.shields.io/github/stars/amaqsood90/KQL-Codex?style=flat-square&color=yellow"/>
<img src="https://img.shields.io/github/last-commit/amaqsood90/KQL-Codex?style=flat-square&color=blue"/>
<img src="https://img.shields.io/badge/Queries-50%2B-brightgreen?style=flat-square"/>
<img src="https://img.shields.io/badge/Campaigns-5-orange?style=flat-square"/>
<img src="https://img.shields.io/badge/Contributions-Welcome-brightgreen?style=flat-square"/>

<br/><br/>

### Production-grade KQL detection content for Microsoft Sentinel and Defender XDR defenders
### Every query ships with MITRE mapping · tuning guidance · validation steps · alert rule settings

<br/>

> Built for the community. Freely available. Continuously updated.

</div>

---

## Why KQL-Codex

There are plenty of KQL repositories. This one is different in a few ways:

- **Campaign-driven** — detections are built around real active threats, not generic patterns
- **Production-ready** — every query includes tuning guidance, validation steps, and alert rule settings so you can deploy with confidence
- **Behavior-based** — detections focus on attacker behavior, not brittle IOCs that rotate daily
- **Full kill chain** — campaign packs cover initial access through exfiltration, not just one stage
- **Microsoft-native** — built exclusively on Microsoft security tables so everything works out of the box in Sentinel and Defender XDR

---

## Campaign Detection Packs

Purpose-built detection sets tracking active real-world campaigns, built within days of exploitation being observed in the wild.

<table>
<tr>
<td width="50%">

### React2Shell-2025
**CVE-2025-55182 | Active Exploitation**

Pre-auth RCE in React Server Components. Attackers deployed crypto miners, Cobalt Strike beacons, and the Secret-Hunter credential harvesting toolkit via Node and Bun process abuse.

**4 detections** covering HTTP header exploitation, process behavior, C2 communications, and payload drops in temp directories.

`T1190` `T1059.003` `T1105` `T1071.001` `T1567.002`

[View Campaign](Hunting-Queries-Detection-Rules/Campaigns/React2Shell-2025/)

</td>
<td width="50%">

### Shai-Hulud-2025
**npm Supply Chain | Postinstall Abuse**

Malicious npm packages abusing postinstall hooks to invoke secret scanners (TruffleHog, Gitleaks), exfiltrate credentials to GitHub and webhook endpoints, and establish persistence across Windows, Linux, and macOS.

**11 detections** covering the full kill chain including a Sentinel watchlist integration for compromised package names.

`T1195.002` `T1552` `T1543.002` `T1547.009` `T1568`

[View Campaign](Hunting-Queries-Detection-Rules/Campaigns/Shai-Hulud-2025/)

</td>
</tr>
<tr>
<td width="50%">

### SharePoint-2025
**CVE-2025-53770 | ToolShell**

Chained SharePoint zero-days exploited by Chinese APT groups including Linen Typhoon (APT27) and Violet Typhoon (APT31) targeting government and healthcare sectors globally.

**1 detection** targeting exploit request patterns to the vulnerable ToolPane.aspx endpoint.

`T1190`

[View Campaign](Hunting-Queries-Detection-Rules/Campaigns/SharePoint-2025/)

</td>
<td width="50%">

### White-Lock-2025
**Ransomware | October 2025**

Newly observed ransomware strain identified by CYFIRMA. Encrypts files with the `.fbin` extension and drops `c0ntact.txt` ransom notes across compromised endpoints.

**1 detection** covering file encryption IOCs and ransom note creation behavior.

`T1486`

[View Campaign](Hunting-Queries-Detection-Rules/Campaigns/White-Lock-2025/)

</td>
</tr>
<tr>
<td width="50%">

### Tycoon2FA-2026
**AiTM PhaaS | Storm-1747 | Disrupted March 2026**

Tycoon2FA enabled adversary-in-the-middle attacks at scale — intercepting session cookies to bypass MFA across 500,000+ organizations per month. Operated by Storm-1747, disrupted by Microsoft DCU and Europol on March 4, 2026.

**4 detections** covering AiTM risky sign-ins, URL click to sign-in correlation, post-compromise inbox rules, and new MFA device registration.

`T1557` `T1078` `T1566.002` `T1137.005` `T1098.005`

[View Campaign](Hunting-Queries-Detection-Rules/Campaigns/Tycoon2FA-2026/)

</td>
<td width="50%"></td>
</tr>
</table>

---

## 🗂️ Repository Structure

> `KQL-Codex/` &nbsp;›&nbsp; `Hunting-Queries-Detection-Rules/`

<details>
<summary>📁 <b>AzureAD/</b> &nbsp;·&nbsp; Sign-ins, brute force, MFA abuse, impossible travel</summary>
</details>

<details>
<summary>📂 <b>Campaigns/</b> &nbsp;·&nbsp; Active threat campaign detection packs</summary>

<p>
&nbsp;&nbsp;&nbsp;&nbsp;• <a href="Hunting-Queries-Detection-Rules/Campaigns/React2Shell-2025/">React2Shell-2025</a> — CVE-2025-55182 · Node RCE · <code>T1190</code> <code>T1059</code><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;• <a href="Hunting-Queries-Detection-Rules/Campaigns/Shai-Hulud-2025/">Shai-Hulud-2025</a> — npm supply chain abuse · <code>T1195.002</code> <code>T1552</code><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;• <a href="Hunting-Queries-Detection-Rules/Campaigns/SharePoint-2025/">SharePoint-2025</a> — CVE-2025-53770 · ToolShell · <code>T1190</code><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;• <a href="Hunting-Queries-Detection-Rules/Campaigns/White-Lock-2025/">White-Lock-2025</a> — White Lock ransomware · <code>T1486</code><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;• <a href="Hunting-Queries-Detection-Rules/Campaigns/Tycoon2FA-2026/">Tycoon2FA-2026</a> — AiTM PhaaS · Storm-1747 · <code>T1557</code> <code>T1566.002</code>
</p>

</details>

<details>
<summary>📂 <b>Cloud-Activity/</b> &nbsp;·&nbsp; Azure resource abuse, automation, key vault</summary>

<p>&nbsp;&nbsp;&nbsp;&nbsp;📁 <b>GitHub/</b> &nbsp;·&nbsp; GitHub audit log worm and backdoor hunting</p>

</details>

<details>
<summary>📁 <b>Defender-For-Endpoint/</b> &nbsp;·&nbsp; Process, file, network, and persistence detection</summary>
</details>

<details>
<summary>📁 <b>Defender-For-Identity/AD/</b> &nbsp;·&nbsp; Kerberos attacks, DCSync, AD enumeration</summary>
</details>

<details>
<summary>📁 <b>Defender-For-Office365/</b> &nbsp;·&nbsp; Phishing, BEC, AiTM, malicious attachments</summary>
</details>

<details>
<summary>📁 <b>Network-Logs/</b> &nbsp;·&nbsp; DNS tunneling, proxy abuse, CVE exploitation</summary>
</details>

<details>
<summary>📁 <b>Sentinel/</b> &nbsp;·&nbsp; UEBA anomalies, incident pivots, correlations</summary>
</details>

<details>
<summary>📁 <b>ThreatIntel-Integrations/</b> &nbsp;·&nbsp; Watchlist and IOC-driven hunting</summary>
</details>

---

## MITRE ATT&CK Coverage

| Tactic | Techniques Covered |
|---|---|
| Initial Access | T1078, T1190, T1195.002, T1566.002 |
| Execution | T1059.001, T1059.003 |
| Persistence | T1098.005, T1137.005, T1543.002, T1547.009, T1547.015 |
| Privilege Escalation | T1548.003 |
| Defense Evasion | T1036, T1070.004 |
| Credential Access | T1110, T1552 |
| Discovery | T1082 |
| Lateral Movement | T1021 |
| Collection | T1557 |
| Command and Control | T1071.001, T1567.002, T1105 |
| Exfiltration | T1005, T1568 |
| Impact | T1486 |

---

## Query Standards

Every query in this repository follows a consistent documentation standard so you always know what you are deploying.
```kql
// Title:        [Query name]
// Product:      [Sentinel | MDE | MDI | MDO | Azure]
// Query Type:   [Threat Hunting | Detection Rule]
// ATT&CK:       [Technique ID] ([Technique Name])
// Data Sources: [Tables used]
// Description:  [What this detects and why it matters]
// Author:       Ahsan M.
//
// Tuning:       [How to reduce false positives for your environment]
// Validation:   [How to confirm the query works before deploying]
//
// Recommended Alert Rule Settings:
//  - Schedule:        [e.g. every 15 minutes]
//  - Lookup window:   [e.g. 1 hour]
//  - Threshold:       [e.g. >0 results]
//  - Severity:        [Low | Medium | High | Critical]
//  - Entity mappings: [Account, Host, IP, etc.]
```

---

## Quick Start
```bash
git clone https://github.com/amaqsood90/KQL-Codex.git
cd KQL-Codex
```

1. Navigate to the folder matching your data source or use case
2. Open any `.kql` file — every query is fully self-documented
3. Paste into your Sentinel hunting pane or Analytics Rule Wizard
4. Read the tuning and validation comments before deploying to production

---

## Threat Intelligence & News Sources

Stay current with the threats this repository tracks. These are the primary sources used when building campaign detection packs.

**Microsoft Security**
- [Microsoft Security Blog](https://www.microsoft.com/en-us/security/blog/) — first-party threat research and Defender/Sentinel updates
- [Microsoft Threat Intelligence](https://ti.defender.microsoft.com/) — Microsoft's threat intel portal
- [MSRC Security Updates](https://msrc.microsoft.com/update-guide/) — official CVE advisories and patch guidance

**Threat Research**
- [CISA Advisories](https://www.cisa.gov/news-events/cybersecurity-advisories) — US government threat advisories and IOCs
- [Unit 42 Threat Research](https://unit42.paloaltonetworks.com/) — Palo Alto Networks threat intelligence
- [CrowdStrike Adversary Intelligence](https://www.crowdstrike.com/blog/category/threat-intelligence/) — adversary tracking and TTP analysis
- [Elastic Security Labs](https://www.elastic.co/security-labs) — malware analysis and detection research
- [Recorded Future Blog](https://www.recordedfuture.com/blog) — threat intelligence and campaign tracking

**Vulnerability Tracking**
- [NIST NVD](https://nvd.nist.gov/) — National Vulnerability Database
- [CVE.org](https://www.cve.org/) — CVE details and references
- [Exploit DB](https://www.exploit-db.com/) — public exploits and proof-of-concepts

**Community & News**
- [BleepingComputer](https://www.bleepingcomputer.com/) — breaking security news and malware coverage
- [The Hacker News](https://thehackernews.com/) — daily cybersecurity news
- [Krebs on Security](https://krebsonsecurity.com/) — investigative security journalism
- [Dark Reading](https://www.darkreading.com/) — enterprise security news and analysis
- [Infosecurity Magazine](https://www.infosecurity-magazine.com/) — threat campaign coverage

**IOC Feeds & Hunting**
- [VirusTotal](https://www.virustotal.com/) — file and URL analysis
- [Shodan](https://www.shodan.io/) — internet-exposed infrastructure discovery
- [URLhaus](https://urlhaus.abuse.ch/) — malicious URL tracking
- [MalwareBazaar](https://bazaar.abuse.ch/) — malware sample database
- [OTX AlienVault](https://otx.alienvault.com/) — open threat intelligence platform

---

## Contributing

Contributions from the defender community are welcome and encouraged.

1. Fork the repository and create a feature branch
2. Follow the query header standard above
3. Test your query in a lab or non-production environment
4. Open a Pull Request with a clear description of the threat or behavior being detected

For new campaign packs, include a `README.md` inside the campaign folder describing the threat, affected platforms, and how the queries fit together.

---

## Resources

- [KQL Documentation](https://docs.microsoft.com/en-us/azure/data-explorer/kusto/query/)
- [Advanced Hunting Schema Reference](https://docs.microsoft.com/en-us/microsoft-365/security/defender/advanced-hunting-schema-tables)
- [Microsoft Sentinel Documentation](https://docs.microsoft.com/en-us/azure/sentinel/)
- [MITRE ATT&CK Framework](https://attack.mitre.org/)
- [KQL Playground](https://aka.ms/LADemo)
- [Must Learn KQL](https://aka.ms/MustLearnKQL)

---

## License

[MIT](LICENSE) — free to use, share, and adapt with attribution.

---

<div align="center">

*Maintained by Ahsan M. If this repository helps your defensive work, consider giving it a star and contributing a query.*

</div>

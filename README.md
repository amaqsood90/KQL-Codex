# KQL-Codex

![KQL](https://img.shields.io/badge/KQL-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)
![Microsoft Sentinel](https://img.shields.io/badge/Microsoft%20Sentinel-0078D4?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![Defender](https://img.shields.io/badge/Microsoft%20Defender-00BCF2?style=for-the-badge&logo=microsoft&logoColor=white)
![Azure](https://img.shields.io/badge/Azure-0089D0?style=for-the-badge&logo=microsoftazure&logoColor=white)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/amaqsood90/KQL-Codex/issues)
[![Made with KQL](https://img.shields.io/badge/Made%20with-KQL-blue.svg)](https://docs.microsoft.com/en-us/azure/data-explorer/kusto/query/)
[![GitHub Stars](https://img.shields.io/github/stars/amaqsood90/KQL-Codex?style=social)](https://github.com/amaqsood90/KQL-Codex/stargazers)

**An evolving collection of threat hunting and detection logic for defenders working with the Microsoft security stack.**

[Explore Queries](#repository-structure) | [Quick Start](#quick-start) | [Contributing](#contributing)

---

## About

**KQL-Codex** is a comprehensive library of Kusto Query Language (KQL) scripts designed to accelerate security operations, threat hunting, and incident response across the Microsoft security ecosystem.

Whether you are a Tier-1 analyst investigating alerts or a seasoned threat hunter pursuing advanced adversaries, this repository provides battle-tested queries to enhance your defensive capabilities.

### Key Features

- **SOC Operations** - Streamline daily security operations with production-ready queries
- **Proactive Threat Hunting** - Hunt for advanced threats and suspicious behaviors
- **Incident Investigation** - Accelerate incident response with forensic analysis queries
- **Detection Engineering** - Build and tune custom detection rules
- **Campaign Packs** - Organized detection sets mapped to real-world attack campaigns

### Built For

| Platform | Coverage |
|----------|----------|
| Microsoft Sentinel | Analytics rules, hunting queries, UEBA |
| Microsoft Defender for Endpoint | Process, file, network, and identity telemetry |
| Microsoft Defender for Identity | AD and Kerberos attack detection |
| Microsoft Defender for Office 365 | Email, phishing, and BEC detection |
| Azure AD / Entra ID | Sign-in analytics, privilege escalation, MFA abuse |
| Azure Activity Logs | Resource monitoring, configuration changes |

---

## Repository Structure

```
KQL-Codex/
â””â”€â”€ Hunting-Queries-Detection-Rules/
    â”œâ”€â”€ AzureAD/                        # Sign-ins, MFA abuse, risky user detections
    â”œâ”€â”€ Campaigns/                      # Organized campaign detection packs
    â”‚   â”œâ”€â”€ React2Shell-2025/           # CVE-2025-55182 React Server Components RCE
    â”‚   â”œâ”€â”€ Shai-Hulud-2025/            # npm supply chain postinstall abuse
    â”‚   â”œâ”€â”€ SharePoint-2025/            # CVE-2025-53770 ToolShell exploitation
    â”‚   â””â”€â”€ White-Lock-2025/            # White Lock ransomware campaign
    â”œâ”€â”€ Cloud-Activity/                 # Suspicious Azure activity, key vault access
    â”‚   â””â”€â”€ GitHub/                     # GitHub audit log hunting
    â”œâ”€â”€ Defender-For-Endpoint/          # Endpoint detection, persistence, malware
    â”œâ”€â”€ Defender-For-Identity/AD/       # Kerberos attacks, AD enumeration
    â”œâ”€â”€ Defender-For-Office365/         # Email and phishing detection
    â”œâ”€â”€ Network-Logs/                   # DNS, proxy, and firewall-based hunting
    â”œâ”€â”€ Sentinel/                       # UEBA anomalies, incident pivots
    â””â”€â”€ ThreatIntel-Integrations/       # Watchlist and IoC-based hunts
```

---

## Quick Start

### Prerequisites

- Access to Microsoft Sentinel, Microsoft Defender XDR, or Azure Data Explorer
- Appropriate permissions to run KQL queries in your environment

### Getting Started

1. **Clone the Repository**
   ```bash
   git clone https://github.com/amaqsood90/KQL-Codex.git
   cd KQL-Codex
   ```

2. **Navigate to Your Use Case**
   - Browse folders matching your log source (e.g., `AzureAD/` or `Defender-For-Endpoint/`)
   - Each query includes MITRE mapping, tuning guidance, and validation steps

3. **Copy and Deploy**
   - Copy `.kql` file content to your Sentinel hunting pane or Analytics Rule Wizard
   - Adjust time ranges, thresholds, and allowlists for your environment

---

## Query Conventions

All queries follow consistent documentation standards.

### File Naming Convention

```
<purpose>_<signal>_<entity>.kql
```

Examples: `signin_risky_users.kql`, `npm_shaihulud_process_tree.kql`

### Query Header Template

```kql
// Title: [Descriptive Query Title]
// Product: [Sentinel | MDE | MDI | MDO | Azure]
// Query Type: [Threat Hunting | Detection Rule]
// ATT&CK: [MITRE ATT&CK Technique IDs]
// Data Sources: [Tables used in query]
// Description: [What the query detects and why it matters]
// Author: Ahsan M.
```

---

## MITRE ATT&CK Coverage

| Tactic | Coverage | Example Queries |
|--------|----------|-----------------|
| Initial Access | High | Phishing, Valid Accounts, Public-Facing App Exploitation |
| Persistence | High | Registry Keys, Scheduled Tasks, LaunchAgents |
| Privilege Escalation | Medium | Token Manipulation, Sudo Abuse |
| Defense Evasion | High | Obfuscation, Indicator Removal, ETW Bypass |
| Credential Access | High | Credential Dumping, Brute Force, MFA Fatigue |
| Discovery | Medium | Network Scanning, Account Discovery |
| Lateral Movement | High | Remote Services, Pass the Hash |
| Command and Control | High | Web Protocols, DNS Tunneling, Graph API Abuse |
| Exfiltration | Medium | Exfiltration Over C2, Cloud Storage, Code Repos |

---

## Campaign Detection Packs

| Campaign | CVE / Threat | Queries |
|----------|-------------|---------|
| React2Shell-2025 | CVE-2025-55182 | 4 |
| Shai-Hulud-2025 | npm Supply Chain | 11 |
| SharePoint-2025 | CVE-2025-53770 | 1 |
| White-Lock-2025 | White Lock Ransomware | 1 |

---

## Contributing

Contributions from the security community are welcome.

1. Fork the repository and create a feature branch
2. Follow the query conventions outlined above
3. Test your queries in a lab environment
4. Submit a Pull Request with a clear description

---

## Learning Resources

- [Official KQL Documentation](https://docs.microsoft.com/en-us/azure/data-explorer/kusto/query/)
- [KQL Playground](https://aka.ms/LADemo)
- [Must Learn KQL Series](https://aka.ms/MustLearnKQL)
- [Advanced Hunting Overview](https://docs.microsoft.com/en-us/microsoft-365/security/defender/advanced-hunting-overview)

---

## Roadmap

- [ ] Scattered Spider / Octo Tempest 2025 campaign pack
- [ ] FinalDraft / REF7707 Graph API C2 campaign pack
- [ ] Defender for Identity AD detection queries
- [ ] Defender for Office 365 phishing and BEC queries
- [ ] Azure Cloud Activity hunting queries
- [ ] DNS tunneling and proxy-based hunting
- [ ] UEBA and Sentinel correlation queries

---

## License

MIT License - see [LICENSE](LICENSE) for details.

---

## Contact

**Maintained by:** Ahsan M.

- [LinkedIn](https://www.linkedin.com/in/ahsan-maqsood-03016488/)
- [Email](mailto:am90@outlook.com)

---

*Happy Hunting!*

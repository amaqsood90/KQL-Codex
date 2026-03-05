# ðŸ”· KQL-Codex

<div align="center">
  
  ![KQL](https://img.shields.io/badge/KQL-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)
  ![Microsoft Sentinel](https://img.shields.io/badge/Microsoft%20Sentinel-0078D4?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
  ![Defender](https://img.shields.io/badge/Microsoft%20Defender-00BCF2?style=for-the-badge&logo=microsoft&logoColor=white)
  ![Azure](https://img.shields.io/badge/Azure-0089D0?style=for-the-badge&logo=microsoftazure&logoColor=white)
  
  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
  [![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/amaqsood90/KQL-Codex/issues)
  [![Made with KQL](https://img.shields.io/badge/Made%20with-KQL-blue.svg)](https://docs.microsoft.com/en-us/azure/data-explorer/kusto/query/)
  [![GitHub Stars](https://img.shields.io/github/stars/amaqsood90/KQL-Codex?style=social)](https://github.com/amaqsood90/KQL-Codex/stargazers)
  
  **ðŸ›¡ï¸ An evolving collection of threat hunting and detection logic for defenders working with the Microsoft security stack**
  
  [Explore Queries](#-query-library) â€¢ [Quick Start](#-quick-start) â€¢ [Contributing](#-contributing) â€¢ [Documentation](#-documentation)
  
</div>

---

## ðŸ“– About

**KQL-Codex** is a comprehensive library of Kusto Query Language (KQL) scripts designed to accelerate security operations, threat hunting, and incident response activities across the Microsoft security ecosystem.

Whether you're a Tier-1 analyst investigating alerts or a seasoned threat hunter pursuing advanced adversaries, this repository provides battle-tested queries to enhance your defensive capabilities.

### ðŸŽ¯ Key Features

- **ðŸ” SOC Operations** - Streamline daily security operations with production-ready queries
- **ðŸŽ¯ Proactive Threat Hunting** - Hunt for advanced threats and suspicious behaviors
- **ðŸ”Ž Incident Investigation** - Accelerate incident response with forensic analysis queries
- **ðŸ“Š Log Telemetry Analysis** - Extract insights from security telemetry at scale
- **ðŸ› ï¸ Detection Engineering** - Build and tune custom detection rules

---

## ðŸ“ Repository Structure

```
KQL-Codex/

â””â”€ ðŸ“‚ Hunting-Queries-Detection-Rules/
    â”œâ”€ ðŸ”‘ AzureAD/                        # Sign-ins, MFA abuse, risky user detections
    â”œâ”€ ðŸ“ Campaigns/                       # Organized campaign detection packs
    â”‚   â”œâ”€ ðŸ§ª React2Shell-2025/            # CVE-2025-55182 React Server Components RCE
    â”‚   â”œâ”€ ðŸ§ª Shai-Hulud-2025/            # npm supply chain postinstall abuse
    â”‚   â”œâ”€ ðŸ§ª SharePoint-2025/            # CVE-2025-53770 ToolShell exploitation
    â”‚   â””â”€ ðŸ§ª White-Lock-2025/            # White Lock ransomware campaign
    â”œâ”€ â˜ï¸ Cloud-Activity/                  # Suspicious Azure activity, key vault access
    â”‚   â””â”€ ðŸ™ GitHub/                      # GitHub audit log hunting
    â”œâ”€ ðŸ’» Defender-For-Endpoint/           # Endpoint detection, persistence, malware
    â”œâ”€ ðŸ§¬ Defender-For-Identity/AD/        # Kerberos attacks, AD enumeration
    â”œâ”€ âœ‰ï¸ Defender-For-Office365/          # Email and phishing detection
    â”œâ”€ ðŸŒ Network-Logs/                    # DNS, proxy, and firewall-based hunting
    â”œâ”€ ðŸ›° Sentinel/                        # UEBA anomalies, incident pivots
    â””â”€ ðŸ—‚ ThreatIntel-Integrations/        # Watchlist and IoC-based hunts
```

---

## ðŸš€ Quick Start

1. **Clone the Repository**
   ```bash
   git clone https://github.com/amaqsood90/KQL-Codex.git
   ```

2. **Navigate to Your Use Case**
   - Browse folders matching your log source (e.g., `AzureAD/` or `Defender-For-Endpoint/`)
   - Each query includes MITRE mapping, tuning, and validation guidance

3. **Copy & Deploy**
   - Copy `.kql` content to your Sentinel hunting pane or Analytics Rule Wizard
   - Adjust time ranges, thresholds, and allowlists for your environment

---

## ðŸ“ Query Conventions

### Query Header Template
```kql
// Title: [Descriptive Query Title]
// Product: [Sentinel | MDE | MDI | MDO | Azure]
// Query Type: [Threat Hunting | Detection Rule]
// ATT&CK: [MITRE ATT&CK Technique IDs]
// Data Sources: [Tables used]
// Description: [What the query detects]
// Author: Ahsan M.
```

---

## ðŸ—ºï¸ MITRE ATT&CK Coverage

| Tactic | Coverage | Example Queries |
|--------|----------|-----------------|
| ðŸŽ¯ **Initial Access** | High | Phishing, Valid Accounts |
| ðŸ”„ **Persistence** | High | Registry Keys, Scheduled Tasks |
| ðŸ”‘ **Privilege Escalation** | Medium | Token Manipulation, Process Injection |
| ðŸ›¡ï¸ **Defense Evasion** | High | Obfuscation, Indicator Removal |
| ðŸ” **Credential Access** | High | Credential Dumping, Brute Force |
| ðŸ” **Discovery** | Medium | Network Scanning, Account Discovery |
| ðŸš¶ **Lateral Movement** | High | Remote Services, Pass the Hash |
| ðŸŒ **Command & Control** | High | Web Protocols, DNS Tunneling |
| ðŸ“¤ **Exfiltration** | Medium | Exfiltration Over C2, Cloud Storage |

---

## ðŸ“š Learning Resources

- ðŸ“– [Official KQL Documentation](https://docs.microsoft.com/en-us/azure/data-explorer/kusto/query/)
- ðŸŽ® [KQL Playground](https://aka.ms/LADemo)
- ðŸ“º [Must Learn KQL Series](https://aka.ms/MustLearnKQL)

---

## ðŸ“„ License

MIT License â€” see [LICENSE](LICENSE) for details.

---

## ðŸ“ž Contact

**Maintained by:** Ahsan M.

- ðŸ’¼ [LinkedIn](https://www.linkedin.com/in/ahsan-maqsood-03016488/)
- ðŸ“§ [Email](mailto:am90@outlook.com)

---

<div align="center">

**Happy Hunting! ðŸŽ¯**

</div>

# 🔷 KQL-Codex

<div align="center">
  
  ![KQL](https://img.shields.io/badge/KQL-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)
  ![Microsoft Sentinel](https://img.shields.io/badge/Microsoft%20Sentinel-0078D4?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
  ![Defender](https://img.shields.io/badge/Microsoft%20Defender-00BCF2?style=for-the-badge&logo=microsoft&logoColor=white)
  ![Azure](https://img.shields.io/badge/Azure-0089D0?style=for-the-badge&logo=microsoftazure&logoColor=white)
  
  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
  [![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/yourusername/KQL-Codex/issues)
  [![Made with KQL](https://img.shields.io/badge/Made%20with-KQL-blue.svg)](https://docs.microsoft.com/en-us/azure/data-explorer/kusto/query/)
  [![GitHub Stars](https://img.shields.io/github/stars/yourusername/KQL-Codex?style=social)](https://github.com/yourusername/KQL-Codex/stargazers)
  
  **🛡️ An evolving collection of threat hunting and detection logic for defenders working with the Microsoft security stack**
  
  [Explore Queries](#-query-library) • [Quick Start](#-quick-start) • [Contributing](#-contributing) • [Documentation](#-documentation)
  
</div>

---

## 📖 About

**KQL-Codex** is a comprehensive library of Kusto Query Language (KQL) scripts designed to accelerate security operations, threat hunting, and incident response activities across the Microsoft security ecosystem.

Whether you're a Tier-1 analyst investigating alerts or a seasoned threat hunter pursuing advanced adversaries, this repository provides battle-tested queries to enhance your defensive capabilities.

### 🎯 Key Features

- **🔍 SOC Operations** - Streamline daily security operations with production-ready queries
- **🎯 Proactive Threat Hunting** - Hunt for advanced threats and suspicious behaviors
- **🔎 Incident Investigation** - Accelerate incident response with forensic analysis queries
- **📊 Log Telemetry Analysis** - Extract insights from security telemetry at scale
- **🛠️ Detection Engineering** - Build and tune custom detection rules

### 🏢 Built For

<table>
<tr>
<td width="50%">
  
**Microsoft Sentinel** 
- Cloud-native SIEM/SOAR
- Advanced analytics rules
- Hunting queries & notebooks
  
</td>
<td width="50%">
  
**Microsoft Defender Suite**
- Defender for Endpoint
- Defender for Identity  
- Defender for Office 365
- Defender for Cloud Apps
  
</td>
</tr>
<tr>
<td width="50%">
  
**Azure AD (Entra ID)**
- Identity protection
- Sign-in analytics
- Privilege escalation detection
  
</td>
<td width="50%">
  
**Azure Activity Logs**
- Resource monitoring
- Configuration changes
- Compliance tracking
  
</td>
</tr>
</table>

---

## 📁 Repository Structure

```
KQL-Codex/

└─ 📂 Hunting-Queries-Detection-Rules/
    ├─ 🔑 AzureAD/                  # Sign-ins, MFA abuse, risky user detections
    ├─ ☁️ Cloud-Activity/            # Suspicious Azure activity, key vault access, automation accounts
    │   └─ 🐙 GitHub/                 # GitHub audit logs & raw content, suspicious access
    ├─ 💻 Defender-For-Endpoint/      # Endpoint detection, persistence, malware activity
    ├─ 🧬 Defender-For-Identity/AD/   # Defender for Identity detection queries
    ├─ ✉️ Defender-For-Office365/     # Email & phishing detection queries
    ├─ 🌐 Network-Logs/               # DNS, proxy, and firewall-based hunting
    ├─ 🛰 Sentinel/                  # UEBA anomalies, incident pivots, custom rules
    ├─ 🗂 ThreatIntel-Integrations/   # Watchlist/IoC hunts & threat intel feeds
    
        └─ 📁 Campaigns/                  # Organized campaign indices & combined queries

        └─ 🧪 Shai-Hulud-2025/        # Shai-Hulud npm campaign queries and index


                         # You are here!

---

## 🚀 Quick Start

### Prerequisites

- Access to Microsoft Sentinel, Microsoft Defender XDR, or Azure Data Explorer
- Appropriate permissions to run KQL queries in your environment
- Basic understanding of KQL syntax (see [Learning Resources](#-learning-resources))

### Getting Started

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/KQL-Codex.git
   cd KQL-Codex
   ```

2. **Navigate to Your Use Case**
   - Browse folders matching your log source (e.g., `AzureAD/` or `Defender-For-Endpoint/`)
   - Each query includes detailed comments and usage instructions

3. **Copy & Customize**
   - Copy the `.kql` file content to your Sentinel hunting pane or Analytics Rule Wizard
   - Adjust time ranges, thresholds, and parameters as needed for your environment

4. **Test & Deploy**
   - Validate query syntax and results in your environment
   - Save as hunting queries, analytics rules, or workbook components

---

## 📝 Query Conventions

All queries follow consistent naming and documentation standards:

### File Naming Convention
```
<Purpose>_<Signal>_<Entity>.kql
```
Examples:
- `signin_risky_users.kql` 
- `dns_suspicious_tunneling.kql`

### Query Header Template
```kql
// Title: [Descriptive Query Title]
// Product: [Sentinel | MDE | MDI | MDO | Azure]
// ATT&CK: [MITRE ATT&CK Technique IDs]
// Data Sources: [Tables used in query]
// Author: @yourgithubhandle
// Notes: [Important considerations or prerequisites]
//
// Description:
// [Detailed explanation of what the query detects]
//
// Query:
[Your KQL query here]
```

---

## 🗺️ MITRE ATT&CK Coverage

Queries are mapped to MITRE ATT&CK techniques to help align detection coverage with known adversary behaviors:

| Tactic | Coverage | Example Queries |
|--------|----------|-----------------|
| 🎯 **Initial Access** | High | Phishing, Valid Accounts |
| 🔄 **Persistence** | High | Registry Keys, Scheduled Tasks |
| 🔑 **Privilege Escalation** | Medium | Token Manipulation, Process Injection |
| 🛡️ **Defense Evasion** | High | Obfuscation, Indicator Removal |
| 🔐 **Credential Access** | High | Credential Dumping, Brute Force |
| 🔍 **Discovery** | Medium | Network Service Scanning, Account Discovery |
| 🚶 **Lateral Movement** | High | Remote Services, Pass the Hash |
| 📦 **Collection** | Medium | Data from Local System, Email Collection |
| 🌐 **Command & Control** | High | Web Protocols, DNS Tunneling |
| 📤 **Exfiltration** | Medium | Exfiltration Over C2, Cloud Storage |

---

## 🤝 Contributing

We welcome contributions from the security community! Here's how you can help:

### Ways to Contribute

- 📝 **Submit new queries** - Share your detection logic
- 🐛 **Report issues** - Found a bug or false positive? Let us know
- 💡 **Suggest improvements** - Help optimize existing queries
- 📚 **Improve documentation** - Help others understand the queries better
- ⭐ **Star the repo** - Show your support and help others discover the project

### Contribution Guidelines

1. **Fork the repository** and create a feature branch
2. **Follow the query conventions** outlined above
3. **Test your queries** in a lab environment
4. **Document your queries** with clear descriptions and use cases
5. **Submit a Pull Request** with a detailed description

For detailed guidelines, see [CONTRIBUTING.md](CONTRIBUTING.md)

---

## 📚 Learning Resources

New to KQL? Start here:

- 📖 [Official KQL Documentation](https://docs.microsoft.com/en-us/azure/data-explorer/kusto/query/)
- 🎮 [KQL Playground](https://aka.ms/LADemo) - Practice without a subscription
- 📺 [Must Learn KQL Series](https://aka.ms/MustLearnKQL) - Video tutorials
- 🏫 [KQL Cheat Sheet](https://github.com/marcusbakker/KQL/blob/master/kql_cheat_sheet.pdf) - Quick reference
- 🎯 [Hunting with KQL](https://docs.microsoft.com/en-us/microsoft-365/security/defender/advanced-hunting-overview)

---

## 🛠️ Roadmap

- [ ] Add automated testing for query validation
- [ ] Create query performance benchmarks
- [ ] Build interactive query builder tool
- [ ] Develop threat hunting playbooks
- [ ] Add integration with SOAR platforms
- [ ] Create video tutorials for complex queries
- [ ] Expand coverage for cloud-native threats

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

Special thanks to:
- The Microsoft security community
- Contributors and maintainers
- Security researchers sharing their detection logic
- Everyone working to make the internet a safer place

---

## 📞 Contact

**Maintained by:** Ahsan M.

- 💼 [LinkedIn](https://www.linkedin.com/in/ahsan-maqsood-03016488/)
- 📧 [Email](mailto:am90@outlook.com)
- 🌐 [Blog](COMING SOON)

---

<div align="center">
  
### 🌟 If you find this repository helpful, please consider giving it a star! 🌟
  
[![Star History Chart](https://api.star-history.com/svg?repos=yourusername/KQL-Codex&type=Date)](https://star-history.com/#yourusername/KQL-Codex&Date)
  
**Happy Hunting! 🎯**
  
</div>

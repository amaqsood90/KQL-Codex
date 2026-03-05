# KQL-Codex Full Restore Script
# Run from: C:\Users\Gray\KQL-Codex
# This script recreates all files, commits, and pushes to GitHub

git config --global user.email "am90@outlook.com"
git config --global user.name "Ahsan M."

# ── Create all directories ───────────────────────────────────────────────────
$dirs = @(
    "Hunting-Queries-Detection-Rules\AzureAD",
    "Hunting-Queries-Detection-Rules\Campaigns\React2Shell-2025",
    "Hunting-Queries-Detection-Rules\Campaigns\Shai-Hulud-2025",
    "Hunting-Queries-Detection-Rules\Campaigns\SharePoint-2025",
    "Hunting-Queries-Detection-Rules\Campaigns\White-Lock-2025",
    "Hunting-Queries-Detection-Rules\Cloud-Activity\GitHub",
    "Hunting-Queries-Detection-Rules\Defender-For-Endpoint",
    "Hunting-Queries-Detection-Rules\Defender-For-Identity\AD",
    "Hunting-Queries-Detection-Rules\Defender-For-Office365",
    "Hunting-Queries-Detection-Rules\Network-Logs",
    "Hunting-Queries-Detection-Rules\Sentinel",
    "Hunting-Queries-Detection-Rules\ThreatIntel-Integrations"
)
foreach ($dir in $dirs) {
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
}
Write-Host "Directories created." -ForegroundColor Cyan

# ── ROOT README ──────────────────────────────────────────────────────────────
Set-Content -Path "README.md" -Encoding UTF8 -Value @'
# 🔷 KQL-Codex

<div align="center">
  
  ![KQL](https://img.shields.io/badge/KQL-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)
  ![Microsoft Sentinel](https://img.shields.io/badge/Microsoft%20Sentinel-0078D4?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
  ![Defender](https://img.shields.io/badge/Microsoft%20Defender-00BCF2?style=for-the-badge&logo=microsoft&logoColor=white)
  ![Azure](https://img.shields.io/badge/Azure-0089D0?style=for-the-badge&logo=microsoftazure&logoColor=white)
  
  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
  [![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/amaqsood90/KQL-Codex/issues)
  [![Made with KQL](https://img.shields.io/badge/Made%20with-KQL-blue.svg)](https://docs.microsoft.com/en-us/azure/data-explorer/kusto/query/)
  [![GitHub Stars](https://img.shields.io/github/stars/amaqsood90/KQL-Codex?style=social)](https://github.com/amaqsood90/KQL-Codex/stargazers)
  
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

---

## 📁 Repository Structure

```
KQL-Codex/

└─ 📂 Hunting-Queries-Detection-Rules/
    ├─ 🔑 AzureAD/                        # Sign-ins, MFA abuse, risky user detections
    ├─ 📁 Campaigns/                       # Organized campaign detection packs
    │   ├─ 🧪 React2Shell-2025/            # CVE-2025-55182 React Server Components RCE
    │   ├─ 🧪 Shai-Hulud-2025/            # npm supply chain postinstall abuse
    │   ├─ 🧪 SharePoint-2025/            # CVE-2025-53770 ToolShell exploitation
    │   └─ 🧪 White-Lock-2025/            # White Lock ransomware campaign
    ├─ ☁️ Cloud-Activity/                  # Suspicious Azure activity, key vault access
    │   └─ 🐙 GitHub/                      # GitHub audit log hunting
    ├─ 💻 Defender-For-Endpoint/           # Endpoint detection, persistence, malware
    ├─ 🧬 Defender-For-Identity/AD/        # Kerberos attacks, AD enumeration
    ├─ ✉️ Defender-For-Office365/          # Email and phishing detection
    ├─ 🌐 Network-Logs/                    # DNS, proxy, and firewall-based hunting
    ├─ 🛰 Sentinel/                        # UEBA anomalies, incident pivots
    └─ 🗂 ThreatIntel-Integrations/        # Watchlist and IoC-based hunts
```

---

## 🚀 Quick Start

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

## 📝 Query Conventions

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

## 🗺️ MITRE ATT&CK Coverage

| Tactic | Coverage | Example Queries |
|--------|----------|-----------------|
| 🎯 **Initial Access** | High | Phishing, Valid Accounts |
| 🔄 **Persistence** | High | Registry Keys, Scheduled Tasks |
| 🔑 **Privilege Escalation** | Medium | Token Manipulation, Process Injection |
| 🛡️ **Defense Evasion** | High | Obfuscation, Indicator Removal |
| 🔐 **Credential Access** | High | Credential Dumping, Brute Force |
| 🔍 **Discovery** | Medium | Network Scanning, Account Discovery |
| 🚶 **Lateral Movement** | High | Remote Services, Pass the Hash |
| 🌐 **Command & Control** | High | Web Protocols, DNS Tunneling |
| 📤 **Exfiltration** | Medium | Exfiltration Over C2, Cloud Storage |

---

## 📚 Learning Resources

- 📖 [Official KQL Documentation](https://docs.microsoft.com/en-us/azure/data-explorer/kusto/query/)
- 🎮 [KQL Playground](https://aka.ms/LADemo)
- 📺 [Must Learn KQL Series](https://aka.ms/MustLearnKQL)

---

## 📄 License

MIT License — see [LICENSE](LICENSE) for details.

---

## 📞 Contact

**Maintained by:** Ahsan M.

- 💼 [LinkedIn](https://www.linkedin.com/in/ahsan-maqsood-03016488/)
- 📧 [Email](mailto:am90@outlook.com)

---

<div align="center">

**Happy Hunting! 🎯**

</div>
'@

# ── AzureAD ──────────────────────────────────────────────────────────────────
Set-Content -Path "Hunting-Queries-Detection-Rules\AzureAD\account_lockouts.kql" -Encoding UTF8 -Value @'
// Title: Account Lockouts
// Product: Sentinel | AzureAD
// Query Type: Detection Rule
// ATT&CK: T1110 (Brute Force)
// Data Sources: SigninLogs
// Description: Identifies user account lockouts by scanning Azure AD SigninLogs for result code 50053 and summarizing lockouts per user per hour.
// Author: Ahsan M.

SigninLogs
| where ResultType == "50053"  // account lockout
| summarize Lockouts = count() by UserPrincipalName, bin(TimeGenerated, 1h)
| order by Lockouts desc
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\AzureAD\excessive_failed_logins.kql" -Encoding UTF8 -Value @'
// Title: Excessive Failed Logins
// Product: Sentinel | AzureAD
// Query Type: Detection Rule
// ATT&CK: T1110 (Brute Force)
// Data Sources: SigninLogs
// Description: Detects accounts with an excessive number of failed logins in Azure AD by counting failed authentication results within hourly windows and filtering on counts greater than 10.
// Author: Ahsan M.

SigninLogs
| where ResultType in ("50074", "50126", "50055", "50057")  // failed auth codes
| summarize FailedAttempts = count() by UserPrincipalName, IPAddress, bin(TimeGenerated, 1h)
| where FailedAttempts > 10
| order by FailedAttempts desc
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\AzureAD\impossible_travel.kql" -Encoding UTF8 -Value @'
// Title: Impossible Travel Detection
// Product: Sentinel | AzureAD
// Query Type: Threat Hunting
// ATT&CK: T1078 (Valid Accounts)
// Data Sources: SigninLogs
// Description: Hunts for users who successfully sign in from two geographically
// distinct locations within a 2-hour window — a pattern consistent with session
// hijacking, credential sharing, or account compromise. Uses serialize/prev()
// to compare consecutive sign-ins per user without a cartesian self-join.
// Only considers successful sign-ins (ResultType 0) to reduce noise.
// Author: Ahsan M.

SigninLogs
| where TimeGenerated > ago(14d)
| where ResultType == "0"                          // successful sign-ins only
| where isnotempty(Location) and isnotempty(IPAddress)
| project TimeGenerated, UserPrincipalName, IPAddress, Location, AppDisplayName
| order by UserPrincipalName asc, TimeGenerated asc
| serialize
| extend PrevTime     = prev(TimeGenerated),
         PrevLocation = prev(Location),
         PrevIP       = prev(IPAddress),
         PrevUser     = prev(UserPrincipalName)
| where UserPrincipalName == PrevUser              // same user
| where Location != PrevLocation                  // different country/region
| where IPAddress != PrevIP                       // different IP
| where datetime_diff('minute', TimeGenerated, PrevTime) <= 120  // within 2 hours
| project
    UserPrincipalName,
    FirstLocation  = PrevLocation,
    FirstIP        = PrevIP,
    FirstSeen      = PrevTime,
    SecondLocation = Location,
    SecondIP       = IPAddress,
    SecondSeen     = TimeGenerated,
    MinutesBetween = datetime_diff('minute', TimeGenerated, PrevTime),
    AppDisplayName
| order by MinutesBetween asc                      // shortest gaps are highest priority

// Tuning: Narrow results by adding "| where MinutesBetween < 60" for tighter
// confidence. Allowlist known VPN exit nodes, corporate proxy IPs, or satellite
// ranges that produce recurring false positives. Filter out service accounts or
// shared mailboxes by excluding known UPN patterns (e.g. | where
// UserPrincipalName !has "svc-").

// Validation: Use a VPN to simulate logins from two different countries within
// the window. Confirm the query surfaces the pair with correct MinutesBetween
// value. Verify that consecutive same-location logins for the same user do NOT
// appear in results.

// MITRE Mapping:
//  - T1078 - Valid Accounts (legitimate credentials used from anomalous locations)
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\AzureAD\rare_admin_logins.kql" -Encoding UTF8 -Value @'
// Title: Rare Admin Logins
// Product: Sentinel | AzureAD
// Query Type: Threat Hunting
// ATT&CK: T1078 (Valid Accounts)
// Data Sources: SigninLogs
// Description: Flags rare logins by administrator accounts by identifying admin or administrator logins and highlighting those with fewer than three sign-ins within a day.
// Author: Ahsan M.

SigninLogs
| where UserPrincipalName has_any ("admin","administrator")
| summarize count() by UserPrincipalName, IPAddress, bin(TimeGenerated, 1d)
| where count_ < 3
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\AzureAD\successful_after_multiple_failures.kql" -Encoding UTF8 -Value @'
// Title: Successful Login After Multiple Failures
// Product: Sentinel | AzureAD
// Query Type: Detection Rule
// ATT&CK: T1110 (Brute Force)
// Data Sources: SigninLogs
// Description: Detects instances where a user successfully logs in immediately after multiple failed attempts, indicating a possible credential stuffing or brute force attempt followed by account compromise.
// Author: Ahsan M.

SigninLogs
| project TimeGenerated, UserPrincipalName, IPAddress, ResultType
| serialize
| extend prev = prev(ResultType), prevTime = prev(TimeGenerated)
| where ResultType == "0" and prev in ("50074","50126","50055","50057")
| project UserPrincipalName, IPAddress, LoginTime=TimeGenerated, LastFailed=prevTime
'@

# ── Campaigns — React2Shell-2025 ─────────────────────────────────────────────
Set-Content -Path "Hunting-Queries-Detection-Rules\Campaigns\React2Shell-2025\README.md" -Encoding UTF8 -Value @'
# React2Shell CVE-2025-55182 Campaign (2025)

This campaign addresses the **React2Shell** vulnerability (CVE-2025-55182) affecting React Server Components. The flaw allows a remote unauthenticated attacker to execute arbitrary code by crafting malicious HTTP requests that abuse the `next-action` and `rsc-action-id` headers. Attackers have exploited the bug to deploy **crypto-miners**, **Cobalt Strike** beacons, **Sliver** payloads and the **Secret-Hunter** toolkit.

## Queries in this campaign

- **[react2shell_node_execution_detection.kql](react2shell_node_execution_detection.kql)** - Identifies suspicious Node/Bun processes executing commands associated with React2Shell payloads.
- **[react2shell_http_header_exploitation.kql](react2shell_http_header_exploitation.kql)** - Looks for HTTP requests with the `next-action` or `rsc-action-id` headers indicative of the exploit.
- **[react2shell_c2_and_metadata_detection.kql](react2shell_c2_and_metadata_detection.kql)** - Flags outbound connections to known threat infrastructure and metadata endpoints.
- **[react2shell_temp_file_creation.kql](react2shell_temp_file_creation.kql)** - Detects suspicious file writes in temporary directories involving known payloads.
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\Campaigns\React2Shell-2025\react2shell_node_execution_detection.kql" -Encoding UTF8 -Value @'
// Title: React2Shell Malicious Node/Bun Process Behaviour
// Product: Microsoft Defender for Endpoint - Advanced Hunting
// Query Type: Detection Rule
// ATT&CK: T1059.003 (Command & Script Interpreter: JavaScript), T1105 (Ingress Tool Transfer), T1082 (System Information Discovery)
// Data Sources: DeviceProcessEvents, DeviceNetworkEvents
// Description: Detects suspicious executions of Node.js or Bun processes indicative of React2Shell exploitation.
// Author: Ahsan M.

let suspiciousStrings = dynamic([
    "curl", "wget", "Invoke-WebRequest", "Invoke-Expression",
    "healthcheck.dll", "setup_c3pool_miner", "c3pool",
    "trufflehog", "gitleaks", "setup_bun.js", "bun_environment.js",
    "trycloudflare.com", ".sh", ".zip", ".tar.gz"
]);
let suspiciousArgs = dynamic(["whoami", "id", "uname", "cat /etc/passwd", "powershell", "cmd "]);
DeviceProcessEvents
| where Timestamp > ago(14d)
| where ProcessName in~ ("node", "node.exe", "bun", "bun.exe", "bunjs", "bunjs.exe")
| where CommandLine has_any (suspiciousStrings) or CommandLine has_any (suspiciousArgs)
| project Timestamp, DeviceName, AccountName, FileName=ProcessName, CommandLine,
    ParentProcessName, InitiatingProcessFileName, InitiatingProcessCommandLine

// Tuning: Exclude known safe Node/Bun services by filtering on trusted parent process names,
// known directories or signed binaries.

// Validation: Simulate a React2Shell payload by running a simple Node script that executes
// a curl or PowerShell command. For example: node -e "require('child_process').exec('whoami')"

// MITRE Mapping:
//  - T1059.003 - Command & Script Interpreter: JavaScript
//  - T1105 - Ingress Tool Transfer
//  - T1082 - System Information Discovery

// Recommended Alert Rule Settings:
//  - Schedule: every 15 minutes
//  - Lookup window: 1 hour
//  - Threshold: >0 results
//  - Severity: High
//  - Entity mappings: DeviceName (hostname), AccountName (user), FileName
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\Campaigns\React2Shell-2025\react2shell_http_header_exploitation.kql" -Encoding UTF8 -Value @'
// Title: React2Shell HTTP Header Exploitation Attempt
// Product: Microsoft Sentinel
// Query Type: Detection Rule
// ATT&CK: T1190 (Exploitation of Public-Facing Application)
// Data Sources: CommonSecurityLog, AzureDiagnostics, AppServiceHTTPLogs
// Description: Identifies incoming HTTP POST requests that contain the next-action or rsc-action-id
// headers or exploitation patterns in the request body associated with CVE-2025-55182.
// Author: Ahsan M.

let suspiciousHeaders = dynamic(["next-action", "rsc-action-id"]);
let suspiciousPatterns = dynamic(["$@", '"status":"resolved_model"']);
CommonSecurityLog
| where TimeGenerated > ago(14d)
| where RequestMethod =~ "POST"
| where RequestHeaders has_any (suspiciousHeaders)
      or tostring(RequestBody) has_any (suspiciousPatterns)
| project TimeGenerated, SourceIP=SrcIpAddr, SourcePort=SrcPort, DestinationIP=DestIpAddr,
    DestinationPort=DestPort, RequestMethod, RequestURL, RequestHeaders, RequestBody

// Tuning: Adjust the table name if your environment uses AzureDiagnostics or AppServiceHTTPLogs.
// Filter out known legitimate endpoints that use these headers.

// Validation: Generate a test HTTP POST request to a dev server including the next-action header
// and verify the event is captured.

// MITRE Mapping:
//  - T1190 - Exploitation of Public-Facing Application

// Recommended Alert Rule Settings:
//  - Schedule: every 5 minutes
//  - Lookup window: 30 minutes
//  - Threshold: >0 results
//  - Severity: High
//  - Entity mappings: SourceIP (IP), DestinationIP (IP)
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\Campaigns\React2Shell-2025\react2shell_c2_and_metadata_detection.kql" -Encoding UTF8 -Value @'
// Title: React2Shell C2 and Metadata Exfiltration Detection
// Product: Microsoft Defender for Endpoint - Advanced Hunting
// Query Type: Detection Rule
// ATT&CK: T1071.001 (Application Layer Protocol: Web Protocols), T1567.002 (Exfiltration Over Web Services), T1105 (Ingress Tool Transfer)
// Data Sources: DeviceNetworkEvents
// Description: Flags outbound network connections to known C2 infrastructure and metadata endpoints
// used in the React2Shell campaign including Cloudflare tunnels, C3pool mining pool, and malicious IPs.
// Author: Ahsan M.

let c2IPs = dynamic(["206.237.3.150", "45.77.33.136", "143.198.92.82", "183.6.80.214"]);
let c2Domains = dynamic(["trycloudflare.com", "c3pool", "api.cleanmasters.store"]);
DeviceNetworkEvents
| where Timestamp > ago(14d)
| where RemoteIP in (c2IPs)
       or RemoteUrl has_any (c2Domains)
       or RemoteIP == "169.254.169.254"
| project Timestamp, DeviceName, InitiatingProcessFileName, InitiatingProcessCommandLine,
    RemoteIP, RemotePort, RemoteUrl, Protocol, LocalIP, LocalPort

// Tuning: Maintain an allowlist of legitimate services that use Cloudflare tunnels or connect
// to metadata endpoints. Many legitimate applications may query 169.254.169.254 for cloud
// instance metadata.

// Validation: Simulate C2 connections by performing a DNS lookup or HTTP request to
// trycloudflare.com from a lab system and confirm the query surfaces the event.

// MITRE Mapping:
//  - T1071.001 - Application Layer Protocol: Web Protocols
//  - T1567.002 - Exfiltration Over Web Services
//  - T1105 - Ingress Tool Transfer

// Recommended Alert Rule Settings:
//  - Schedule: every 15 minutes
//  - Lookup window: 1 hour
//  - Threshold: >0 results
//  - Severity: Medium (raise to High if combined with suspicious process indicators)
//  - Entity mappings: DeviceName (hostname), RemoteIP (IP), InitiatingProcessFileName (process)
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\Campaigns\React2Shell-2025\react2shell_temp_file_creation.kql" -Encoding UTF8 -Value @'
// Title: React2Shell Suspicious File Creation in Temporary Directories
// Product: Microsoft Defender for Endpoint - Advanced Hunting
// Query Type: Detection Rule
// ATT&CK: T1036 (Masquerading), T1105 (Ingress Tool Transfer), T1070.004 (File Deletion)
// Data Sources: DeviceFileEvents
// Description: Detects file creations in temporary directories associated with React2Shell exploitation.
// Attackers drop payloads such as healthcheck.dll, setup_c3pool_miner.bat and malicious JS files
// into /tmp on Linux or C:\Windows\Temp on Windows.
// Author: Ahsan M.

let suspiciousFiles = dynamic(["healthcheck.dll", "setup_c3pool_miner.bat", "setup_bun.js", "bun_environment.js"]);
DeviceFileEvents
| where Timestamp > ago(14d)
| where (FolderPath contains "/tmp"
       or FolderPath startswith @"C:\Windows\Temp"
       or FolderPath startswith @"C:\Users\Public\AppData\Local\Temp"
       or FolderPath startswith @"C:\Users\Public\AppData\LocalLow\Temp")
| where FileName has_any (suspiciousFiles) or FileName matches regex @".*\.(dll|so|sh|bat|js)$"
| project Timestamp, DeviceName, FileName, FolderPath, Sha256, InitiatingProcessFileName, InitiatingProcessCommandLine

// Tuning: Exclude known legitimate temporary files created by installers or update agents.
// Filter on trusted initiating processes such as WindowsUpdate or msiexec.

// Validation: Copy a benign DLL with a suspicious name (e.g. healthcheck.dll) into the system
// temp directory on a test endpoint and confirm the query picks it up.

// MITRE Mapping:
//  - T1036 - Masquerading
//  - T1105 - Ingress Tool Transfer
//  - T1070.004 - File Deletion

// Recommended Alert Rule Settings:
//  - Schedule: every 1 hour
//  - Lookup window: 24 hours
//  - Threshold: >0 results
//  - Severity: Medium
//  - Entity mappings: DeviceName (hostname), FileName, Sha256
'@

# ── Campaigns — Shai-Hulud-2025 ──────────────────────────────────────────────
Set-Content -Path "Hunting-Queries-Detection-Rules\Campaigns\Shai-Hulud-2025\README.md" -Encoding UTF8 -Value @'
# Shai Hulud (npm) - 2025 Campaign

**Scope:** npm supply-chain postinstall abuse, secret scanning, GitHub egress and organization abuse.

## Queries

- **MDE:** [npm postinstall chain](../../Hunting-Queries-Detection-Rules/Defender-For-Endpoint/npm_shaihulud_process_tree.kql)
- **MDE:** [Secret scanners invoked](../../Hunting-Queries-Detection-Rules/Defender-For-Endpoint/npm_secret_scanners_invoked.kql)
- **MDE:** [GitHub egress after npm install](../../Hunting-Queries-Detection-Rules/Defender-For-Endpoint/npm_to_github_egress_windowed.kql)
- **MDE:** [Suspicious git/gh activity](../../Hunting-Queries-Detection-Rules/Defender-For-Endpoint/suspicious_git_gh_activity_from_build_hosts.kql)
- **MDE:** [Artifact creation from hooks](../../Hunting-Queries-Detection-Rules/Defender-For-Endpoint/npm_hook_artifact_creation.kql)
- **MDE:** [macOS persistence via LaunchAgents/Daemons](../../Hunting-Queries-Detection-Rules/Defender-For-Endpoint/macos_launchagents_daemons_persistence.kql)
- **MDE:** [Linux persistence via systemd/cron](../../Hunting-Queries-Detection-Rules/Defender-For-Endpoint/linux_systemd_cron_persistence.kql)
- **MDE:** [Malicious artifacts & IOC hash touch](../../Hunting-Queries-Detection-Rules/Defender-For-Endpoint/malicious_artifacts_and_hash_touch.kql)
- **MDE:** [Artifact to Exfil correlation](../../Hunting-Queries-Detection-Rules/Defender-For-Endpoint/artifact_to_exfil_correlation.kql)
- **GitHub:** [Audit worm behaviors](../../Hunting-Queries-Detection-Rules/Cloud-Activity/GitHub/github_audit_worm_behaviors.kql)
- **Watchlist:** [Compromised npm packages](../../Hunting-Queries-Detection-Rules/ThreatIntel-Integrations/watchlist_compromised_npm_packages.kql)

## Watchlist

Create a watchlist named `ShaiHuludNPMPackages` with a `PackageName` column containing lower-case package names from your threat intel feed.

## Tuning

- Allowlist known build agents and sanctioned scripts to reduce noise.
- Adjust `installWindow` and lookback periods to suit your environment.
- Exclude repositories marked internal-sandbox.
'@

# ── Campaigns — SharePoint-2025 ──────────────────────────────────────────────
Set-Content -Path "Hunting-Queries-Detection-Rules\Campaigns\SharePoint-2025\README.md" -Encoding UTF8 -Value @'
# SharePoint-2025 — CVE-2025-53770 Campaign (ToolShell)

This folder collects detection artifacts and guidance related to active exploitation of SharePoint servers (CVE-2025-53770 / CVE-2025-53771), dubbed "ToolShell" by the security community. Threat groups including Linen Typhoon (APT27) and Violet Typhoon (APT31) were among the first observed exploiting these vulnerabilities against government and healthcare targets.

## Queries

- [ToolPane.aspx exploit activity](../../Hunting-Queries-Detection-Rules/Network-Logs/sharepoint_cve_2025_53770_toolpane_exploit.kql) - Detects requests to `/_layouts/15/ToolPane.aspx` with `DisplayMode=Edit` and known exploit parameters.

## Notes

If you have IIS logs forwarded to Sentinel, map `RequestURL` and `RemoteIP` to CommonSecurityLog for this query to work.
'@

# ── Campaigns — White-Lock-2025 ──────────────────────────────────────────────
Set-Content -Path "Hunting-Queries-Detection-Rules\Campaigns\White-Lock-2025\README.md" -Encoding UTF8 -Value @'
# White-Lock-2025 — White Lock Ransomware Campaign

This folder collects detection artifacts and guidance for the "White Lock" ransomware discovered October 2025.

## Queries

- [White Lock ransomware indicators](../../Hunting-Queries-Detection-Rules/Defender-For-Endpoint/white_lock_ransomware_indicators.kql) - Detects `.fbin` encrypted files and `c0ntact.txt` ransom note (CYFIRMA IOCs).
'@

# ── Cloud-Activity / GitHub ───────────────────────────────────────────────────
Set-Content -Path "Hunting-Queries-Detection-Rules\Cloud-Activity\GitHub\github_audit_worm_behaviors.kql" -Encoding UTF8 -Value @'
// Title: GitHub audit indicators of worm/backdoor behavior
// Product: Sentinel | Cloud-Activity/GitHub
// Query Type: Threat Hunting
// ATT&CK: T1568 (Exfil to Code Repo), T1136 (Create Account), T1195 (Supply Chain)
// Data Sources: GitHubAuditLog
// Description: Finds risky repo publicization, token/OAuth events, workflow backdoor attempts.
// Author: Ahsan M.

let startTime = ago(30d);
GitHubAuditLog
| where TimeGenerated >= startTime
| where Action in~ ("repo.create","repo.rename","repo.publicized","repo.add_member","repo.transfer",
                    "oauth_authorization.create","org.create_member","secret_scanning_push_protection.bypass")
       or Action has "workflow" or Action has "actions"
| extend lowerArgs = tolower(Args)
| where lowerArgs has_any ("public","token","secret","trufflehog","gitleaks","npm","postinstall","bundle.js")
| project TimeGenerated, Actor, Repo, Action, Args, Country, TransportProtocol, SourceAddress
| order by TimeGenerated desc
'@

# ── Cloud-Activity README ─────────────────────────────────────────────────────
Set-Content -Path "Hunting-Queries-Detection-Rules\Cloud-Activity\README.md" -Encoding UTF8 -Value @'
# Cloud Activity

Hunting queries for suspicious Azure and cloud platform activity.

## Planned Coverage

- Key Vault access anomalies
- Azure Automation account abuse
- Suspicious AAD application registrations
- Azure resource deletion and modification
- Service principal credential additions
'@

# ── Defender-For-Endpoint ─────────────────────────────────────────────────────
Set-Content -Path "Hunting-Queries-Detection-Rules\Defender-For-Endpoint\artifact_to_exfil_correlation.kql" -Encoding UTF8 -Value @'
// Title: Artifact to Exfil correlation
// Product: Sentinel | Defender-For-Endpoint
// Query Type: Threat Hunting
// ATT&CK: T1105 (Exfiltration), T1005 (Data from Local System)
// Data Sources: DeviceFileEvents, DeviceNetworkEvents
// Description: Correlates creation of suspicious artifacts with outbound connections to GitHub
// and webhook endpoints within a 10-minute window.
// Author: Ahsan M.

let t0 = datetime(2025-07-01);
let win = 10m;
let artifact = DeviceFileEvents
| where Timestamp >= t0
| extend f = tolower(FileName)
| where f in ("data.json","bundle.js","install.js","postinstall.js")
| where InitiatingProcessFileName in~ ("npm","node")
| project DeviceId, ATime = Timestamp, FileName, FolderPath;

DeviceNetworkEvents
| where Timestamp >= t0
| where RemoteUrl has_any ("webhook.site","raw.githubusercontent.com","api.github.com","gist.github.com")
| project DeviceId, NTime = Timestamp, RemoteUrl, RemoteIP, RemotePort,
          InitiatingProcessFileName, InitiatingProcessCommandLine
| join kind=inner artifact on DeviceId
| where NTime between (ATime .. ATime + win)
| order by NTime desc
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\Defender-For-Endpoint\file_download_from_suspicious_domains.kql" -Encoding UTF8 -Value @'
// Title: File Download from Suspicious Domains
// Product: Sentinel | Defender for Endpoint
// Query Type: Detection Rule
// ATT&CK: T1105 (Ingress Tool Transfer)
// Data Sources: DeviceFileEvents
// Description: Identifies file downloads from suspicious domains by looking at DeviceFileEvents
// where the initiating process is a known download utility and the file origin URL contains
// suspicious TLDs or known code hosting services.
// Author: Ahsan M.

DeviceFileEvents
| where InitiatingProcessFileName in ("powershell.exe","cmd.exe","bitsadmin.exe","mshta.exe")
| where FileOriginUrl has_any (".ru",".cn","raw.githubusercontent.com","pastebin.com")
| project Timestamp, DeviceName, AccountName, FileName, FileOriginUrl
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\Defender-For-Endpoint\lateral_movement_remote_service_creation.kql" -Encoding UTF8 -Value @'
// Title: Lateral Movement - Remote Service Creation
// Product: Sentinel | Defender for Endpoint
// Query Type: Detection Rule
// ATT&CK: T1021 (Remote Services)
// Data Sources: DeviceProcessEvents
// Description: Detects potential lateral movement by identifying the creation of remote services
// or remote execution tools. Flags instances where sc.exe is used to create a service or psexec
// is executed.
// Author: Ahsan M.

DeviceProcessEvents
| where ProcessCommandLine has "sc.exe create"
    or ProcessCommandLine has "psexec"
| project Timestamp, DeviceName, AccountName, ProcessCommandLine
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\Defender-For-Endpoint\linux_systemd_cron_persistence.kql" -Encoding UTF8 -Value @'
// Title: Linux persistence via systemd / cron
// Product: Sentinel | Defender-For-Endpoint
// Query Type: Detection Rule
// ATT&CK: T1543.002 (Launch Agent), T1078 (Valid Accounts)
// Data Sources: DeviceFileEvents, DeviceInfo
// Description: Detects modifications to systemd services or cron jobs by npm/node/bash/python
// processes on Linux hosts.
// Author: Ahsan M.

let linux = DeviceInfo | where OSPlatform has "Linux" | project DeviceId;
DeviceFileEvents
| where Timestamp >= ago(60d)
| join kind=inner linux on DeviceId
| where FolderPath has_any (
    "/etc/systemd/system/","/usr/lib/systemd/system/","~/.config/systemd/user/",
    "/etc/cron.d/","/etc/cron.daily/","/etc/cron.hourly/","/etc/crontab")
| where InitiatingProcessFileName in~ ("npm","node","bash","sh","python")
| project Timestamp, DeviceName, FileName, FolderPath, InitiatingProcessFileName, InitiatingProcessCommandLine
| order by Timestamp desc
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\Defender-For-Endpoint\macos_launchagents_daemons_persistence.kql" -Encoding UTF8 -Value @'
// Title: macOS persistence via LaunchAgents/Daemons
// Product: Sentinel | Defender-For-Endpoint
// Query Type: Detection Rule
// ATT&CK: T1547.009 (Launch Agent), T1547.015 (Launch Daemon)
// Data Sources: DeviceFileEvents, DeviceInfo
// Description: Detects persistence on macOS by monitoring LaunchAgents and LaunchDaemons for
// plist files invoked by npm/node/bash/sh/osascript.
// Author: Ahsan M.

let macs = DeviceInfo | where OSPlatform == "macOS" | project DeviceId;
DeviceFileEvents
| where Timestamp >= ago(60d)
| join kind=inner macs on DeviceId
| where FolderPath has_any ("/Library/LaunchAgents/","/Library/LaunchDaemons/","/System/Library/LaunchDaemons/","/Users/")
| where tolower(FileName) endswith ".plist"
| where InitiatingProcessFileName in~ ("npm","node","bash","sh","zsh","python","osascript")
| project Timestamp, DeviceName, FileName, FolderPath, InitiatingProcessFileName, InitiatingProcessCommandLine
| order by Timestamp desc
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\Defender-For-Endpoint\malicious_artifacts_and_hash_touch.kql" -Encoding UTF8 -Value @'
// Title: Malicious artifacts & IOC hash touch
// Product: Sentinel | Defender-For-Endpoint
// Query Type: Detection Rule
// ATT&CK: T1105 (Exfiltration), T1005 (Data from Local System)
// Data Sources: DeviceFileEvents, DeviceNetworkEvents
// Description: Detects creation of malicious artifacts by IOC hashes and suspicious egress to
// known webhook endpoints.
// Author: Ahsan M.

let sha256_iocs = dynamic(["46faab8ab153fae6e80e7cca38eab363075bb524edd79e42269217a083628f09", "b74caeaa75e077c99f7d44f46daaf9796a3be43ecf24f2a1fd381844669da777", "dc67467a39b70d1cd4c1f7f7a459b35058163592f4a9e8fb4dffcbba98ef210c", "4b2399646573bb737c4969563303d8ee2e9ddbd1b271f1ca9e35ea78062538db"]);
let url_iocs = dynamic(["hxxps://webhook.site/bb8ca5f6-4175-45d2-b042-fc9ebb8170b7"]);
let file_events = DeviceFileEvents
| where Timestamp >= ago(60d)
| where SHA256 in (sha256_iocs)
| project Timestamp, DeviceName, EventType = "FileEvent",
    Details = strcat("File: ", FileName, " | Path: ", FolderPath, " | SHA256: ", SHA256),
    InitiatingProcessFileName, InitiatingProcessCommandLine;
let network_events = DeviceNetworkEvents
| where Timestamp >= ago(60d)
| where RemoteUrl has_any (url_iocs)
| project Timestamp, DeviceName, AccountName = InitiatingProcessAccountName, EventType = "NetworkEvent",
    Details = strcat("URL: ", RemoteUrl, " | IP: ", RemoteIP),
    InitiatingProcessFileName, InitiatingProcessCommandLine;

union file_events, network_events
| order by Timestamp desc
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\Defender-For-Endpoint\new_external_connections.kql" -Encoding UTF8 -Value @'
// Title: New External Connections
// Product: Sentinel | Endpoint
// Query Type: Threat Hunting
// ATT&CK: T1071 (Application Layer Protocol)
// Data Sources: DeviceNetworkEvents
// Description: Detects initial outbound network connections to previously unseen public IP addresses,
// identifying potential data exfiltration or command and control channels.
// Author: Ahsan M.

DeviceNetworkEvents
| where RemoteIPType == "Public"
| summarize count() by RemoteIP, InitiatingProcessFileName
| where count_ == 1
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\Defender-For-Endpoint\new_process_execution.kql" -Encoding UTF8 -Value @'
// Title: New Process Execution (EDR)
// Product: Sentinel | Endpoint
// Query Type: Threat Hunting
// ATT&CK: T1059 (Command and Scripting Interpreter)
// Data Sources: DeviceProcessEvents
// Description: Identifies newly observed process executions by listing processes that have only
// one occurrence across DeviceProcessEvents, highlighting potential first-time or rare processes.
// Author: Ahsan M.

DeviceProcessEvents
| summarize count() by FileName
| where count_ == 1
| project NewProcess = FileName
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\Defender-For-Endpoint\npm_hook_artifact_creation.kql" -Encoding UTF8 -Value @'
// Title: Artifact creation from npm hooks (bundle.js/install.js)
// Product: Sentinel | Defender-For-Endpoint
// Query Type: Detection Rule
// ATT&CK: T1105 (Ingress Tool Transfer), T1059 (Command)
// Data Sources: DeviceFileEvents
// Description: Detects creation of suspicious JS artifacts around node_modules following npm activity.
// Author: Ahsan M.

let startTime = ago(30d);
DeviceFileEvents
| where Timestamp >= startTime
| where tolower(FileName) in ("bundle.js", "install.js", "prepare.js")
   or tolower(FolderPath) has_any ("\\node_modules\\", "/node_modules/")
| where InitiatingProcessFileName in~ ("npm", "node")
| project Timestamp, DeviceName, AccountName, FileName, FolderPath, InitiatingProcessFileName, InitiatingProcessCommandLine
| order by Timestamp desc
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\Defender-For-Endpoint\npm_secret_scanners_invoked.kql" -Encoding UTF8 -Value @'
// Title: Secret-scanning tools invoked by npm scripts
// Product: Sentinel | Defender-For-Endpoint
// Query Type: Detection Rule
// ATT&CK: T1552 (Unsecured Credentials), T1036 (Masquerade)
// Data Sources: DeviceProcessEvents
// Description: TruffleHog/Gitleaks/Git-Secrets invoked by npm/postinstall.
// Author: Ahsan M.

let startTime = ago(30d);
DeviceProcessEvents
| where Timestamp >= startTime
| where tolower(ProcessCommandLine) has_any ("trufflehog", "gitleaks", "git-secrets", "detect-secrets")
   or FileName in~ ("trufflehog", "gitleaks", "detect-secrets", "git-secrets")
| where InitiatingProcessFileName in~ ("npm", "npx", "node")
   or tolower(InitiatingProcessCommandLine) has_any ("npm install", "postinstall")
| project Timestamp, DeviceName, AccountName, FileName, ProcessCommandLine, InitiatingProcessFileName, InitiatingProcessCommandLine
| order by Timestamp desc
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\Defender-For-Endpoint\npm_shaihulud_process_tree.kql" -Encoding UTF8 -Value @'
// Title: npm postinstall chain spawning exfil/propagation tools
// Product: Sentinel | Defender-For-Endpoint
// Query Type: Detection Rule
// ATT&CK: T1195.002 (Supply Chain), T1059 (Command), T1105 (Exfil over C2), T1078 (Valid Accounts)
// Data Sources: DeviceProcessEvents
// Description: Finds npm/npx/node installs that spawn curl/wget/PowerShell/bash/git/secret scanners.
// Author: Ahsan M.

let startTime = ago(30d);
DeviceProcessEvents
| where Timestamp >= startTime
| where InitiatingProcessFileName in~ ("npm","npx","node")
   or ProcessCommandLine has_any ("npm i","npm install","npx ")
| extend p = tolower(ProcessCommandLine)
| where p has_any ("postinstall","bundle.js","install.js","prepare")
   or FileName in~ ("node","bash","sh","powershell.exe","pwsh.exe","curl","wget","git","gh","trufflehog")
| project Timestamp, DeviceName, AccountName, FileName, ProcessCommandLine,
          InitiatingProcessFileName, InitiatingProcessCommandLine, InitiatingProcessId, ProcessId, DeviceId
| order by Timestamp asc
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\Defender-For-Endpoint\npm_to_github_egress_windowed.kql" -Encoding UTF8 -Value @'
// Title: npm-driven egress to GitHub/raw/gist/webhook bins
// Product: Sentinel | Defender-For-Endpoint
// Query Type: Detection Rule
// ATT&CK: T1105 (Exfil over Web Services)
// Data Sources: DeviceNetworkEvents, DeviceProcessEvents
// Description: Identifies network traffic to GitHub, raw.githubusercontent.com, gist.github.com
// or webhook bins within 30 minutes after an npm install.
// Author: Ahsan M.

let installWindow = 30m;
let npmInstalls = DeviceProcessEvents
| where Timestamp >= datetime(2025-07-01)
| where tolower(ProcessCommandLine) has_any ("npm install","npm i")
| project DeviceId, InstallTime=Timestamp;
DeviceNetworkEvents
| where Timestamp >= datetime(2025-07-01)
| where RemoteUrl has_any ("github.com","api.github.com","raw.githubusercontent.com","gist.github.com","webhook.site")
    or (RemotePort in (22,443) and RemoteIPType == "Public" and tolower(InitiatingProcessFileName) in ("git","gh","node","curl","wget"))
| join kind=leftouter npmInstalls on DeviceId
| where isnotempty(InstallTime) and Timestamp between (InstallTime .. InstallTime + installWindow)
| project Timestamp, DeviceName, AccountName, InitiatingProcessFileName, InitiatingProcessCommandLine,
          RemoteUrl, RemoteIP, RemotePort
| order by Timestamp desc
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\Defender-For-Endpoint\redis_cve_2025_49844_suspicious_processes.kql" -Encoding UTF8 -Value @'
// Title: Redis CVE-2025-49844 Suspicious Child Processes
// Product: Sentinel | Defender for Endpoint
// Query Type: Detection Rule
// ATT&CK: T1055 (Process Injection) | T1203 (Exploitation for Client Execution)
// Data Sources: DeviceProcessEvents
// Description: Monitors for redis-server spawning shell or scripting processes which could
// indicate exploitation of the RediShell vulnerability enabling code execution on the host.
// Author: Ahsan M.

DeviceProcessEvents
| where InitiatingProcessFileName has_any ("redis-server", "redis-server.exe")
| where FileName has_any ("bash", "sh", "python", "perl", "cmd.exe", "powershell.exe")
| project Timestamp, DeviceName, AccountName, InitiatingProcessFileName, FileName, ProcessCommandLine
| order by Timestamp desc
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\Defender-For-Endpoint\sudo_cve_2025_32462_32463_exploitation.kql" -Encoding UTF8 -Value @'
// Title: Potential Sudo Exploitation (CVE-2025-32462 & CVE-2025-32463)
// Product: Sentinel | Defender for Endpoint (Linux/macOS)
// Query Type: Detection Rule
// ATT&CK: T1548.003 (Abuse Elevation Control Mechanism)
// Data Sources: DeviceProcessEvents
// Description: Detects sudo commands with the -h/--host or -R/--chroot options which were abused
// in two sudo vulnerabilities allowing local users to bypass host checks or load malicious libraries
// to gain root.
// Author: Ahsan M.

DeviceProcessEvents
| where ProcessCommandLine startswith "sudo"
| where ProcessCommandLine contains " -h " or ProcessCommandLine contains " --host "
   or ProcessCommandLine contains " -R " or ProcessCommandLine contains " --chroot "
| project Timestamp, DeviceName, AccountName, ProcessCommandLine
| order by Timestamp desc
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\Defender-For-Endpoint\suspicious_git_gh_activity_from_build_hosts.kql" -Encoding UTF8 -Value @'
// Title: Suspicious git/gh activity likely spawned by build scripts
// Product: Sentinel | Defender-For-Endpoint
// Query Type: Detection Rule
// ATT&CK: T1021 (Lateral Movement), T1608 (Develop Capabilities), T1568 (Exfil to Code Repo)
// Data Sources: DeviceProcessEvents
// Description: Flags forced pushes, repo creation, token usage from npm/runner parents.
// Author: Ahsan M.

let startTime = ago(30d);
DeviceProcessEvents
| where Timestamp >= startTime
| where FileName in~ ("git", "gh")
| extend cmd = tolower(ProcessCommandLine)
| where cmd has_any ("push --force", " push ", "commit -m", "remote add", "token", "gh repo create", "gh api", "gist create")
| where InitiatingProcessFileName in~ ("npm", "node", "bash", "sh", "powershell.exe", "pwsh.exe")
| project Timestamp, DeviceName, AccountName, FileName, ProcessCommandLine, InitiatingProcessFileName, InitiatingProcessCommandLine
| order by Timestamp desc
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\Defender-For-Endpoint\suspicious_powershell_usage.kql" -Encoding UTF8 -Value @'
// Title: Suspicious PowerShell Usage
// Product: Sentinel | Endpoint
// Query Type: Detection Rule
// ATT&CK: T1059.001 (PowerShell)
// Data Sources: DeviceProcessEvents
// Description: Detects suspicious PowerShell command line usage by searching for encoded or hidden
// execution flags or IEX commands which may indicate script-based attacks or obfuscation.
// Author: Ahsan M.

DeviceProcessEvents
| where FileName =~ "powershell.exe"
| where ProcessCommandLine has_any ("-enc","-nop","-w hidden","-exec bypass","IEX")
| project Timestamp, DeviceName, AccountName, ProcessCommandLine
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\Defender-For-Endpoint\white_lock_ransomware_indicators.kql" -Encoding UTF8 -Value @'
// Title: White Lock Ransomware Indicators (fbin and c0ntact.txt)
// Product: Sentinel | Defender for Endpoint
// Query Type: Detection Rule
// ATT&CK: T1486 (Data Encrypted for Impact)
// Data Sources: DeviceFileEvents
// Description: Detects potential White Lock ransomware infections by looking for creation of files
// with the .fbin extension and the ransom note c0ntact.txt (CYFIRMA IOCs).
// Author: Ahsan M.

DeviceFileEvents
| where FileName endswith ".fbin" or FileName == "c0ntact.txt"
| summarize FirstSeen=min(Timestamp), LastSeen=max(Timestamp), Count=count() by DeviceName, AccountName, InitiatingProcessFileName, FileName
| order by Count desc
'@

# ── Defender-For-Identity README ──────────────────────────────────────────────
Set-Content -Path "Hunting-Queries-Detection-Rules\Defender-For-Identity\AD\README.md" -Encoding UTF8 -Value @'
# Defender for Identity / Active Directory

Hunting and detection queries for Kerberos attacks and Active Directory abuse.

## Planned Coverage

- Golden Ticket detection
- Kerberoasting (T1558.003)
- AS-REP Roasting (T1558.004)
- DCSync detection (T1003.006)
- Pass-the-Hash / Pass-the-Ticket
- LDAP enumeration and AD reconnaissance
'@

# ── Defender-For-Office365 README ─────────────────────────────────────────────
Set-Content -Path "Hunting-Queries-Detection-Rules\Defender-For-Office365\README.md" -Encoding UTF8 -Value @'
# Defender for Office 365

Email and phishing detection queries.

## Planned Coverage

- AiTM phishing detection (T1557)
- Business Email Compromise (BEC)
- Malicious attachment execution
- Suspicious inbox rules
- OAuth consent abuse
'@

# ── Network-Logs ──────────────────────────────────────────────────────────────
Set-Content -Path "Hunting-Queries-Detection-Rules\Network-Logs\sharepoint_cve_2025_53770_toolpane_exploit.kql" -Encoding UTF8 -Value @'
// Title: SharePoint CVE-2025-53770 ToolPane Exploit Activity
// Product: Sentinel | Network Logs (IIS/Proxy)
// Query Type: Detection Rule
// ATT&CK: T1190 (Exploitation of Public-Facing Application)
// Data Sources: CommonSecurityLog
// Description: Detects HTTP requests to the vulnerable ToolPane.aspx endpoint with DisplayMode=Edit
// and the exploit parameter pattern from IPs linked to exploitation activity.
// Author: Ahsan M.

CommonSecurityLog
| where RequestURL has "/_layouts/15/ToolPane.aspx"
  and RequestURL contains "DisplayMode=Edit"
  and RequestURL contains "a=/ToolPane.aspx"
| where RemoteIP in ("96.9.125.147", "107.191.58.76", "104.238.159.149")
| summarize Hits=count() by RemoteIP, RequestURL, bin(TimeGenerated, 1h)
| order by Hits desc
'@

Set-Content -Path "Hunting-Queries-Detection-Rules\Network-Logs\README.md" -Encoding UTF8 -Value @'
# Network Logs

DNS, proxy, and firewall-based hunting queries.

## Planned Coverage

- DNS tunneling detection
- Suspicious proxy traffic
- Beaconing pattern detection
- Long connection duration anomalies
- Domain generation algorithm (DGA) detection
'@

# ── Sentinel README ───────────────────────────────────────────────────────────
Set-Content -Path "Hunting-Queries-Detection-Rules\Sentinel\README.md" -Encoding UTF8 -Value @'
# Sentinel

UEBA anomalies, incident pivots, and custom analytics rules.

## Planned Coverage

- UEBA anomaly score pivots
- Cross-alert correlation queries
- Incident enrichment queries
- Entity behavior baselines
- Custom watchlist integrations
'@

# ── ThreatIntel-Integrations ──────────────────────────────────────────────────
Set-Content -Path "Hunting-Queries-Detection-Rules\ThreatIntel-Integrations\watchlist_compromised_npm_packages.kql" -Encoding UTF8 -Value @'
// Title: Watchlist match for compromised npm packages
// Product: Sentinel | Defender-For-Endpoint
// Query Type: Detection Rule
// ATT&CK: T1195.002 (Supply Chain)
// Data Sources: DeviceProcessEvents, Watchlist: ShaiHuludNPMPackages
// Description: Matches npm install commands against a watchlist of known compromised package names.
// Create a watchlist named ShaiHuludNPMPackages with a PackageName column.
// Author: Ahsan M.

let startTime = ago(30d);
let badpkgs =
    _GetWatchlist('ShaiHuludNPMPackages')
    | project PackageName = tolower(PackageName);
DeviceProcessEvents
| where Timestamp >= startTime
| extend cmd = tolower(ProcessCommandLine)
| where cmd has_any ("npm install","npm i")
| join kind=innerunique badpkgs on $left.cmd has $right.PackageName
| project Timestamp, DeviceName, AccountName, SuspiciousPackage = PackageName,
          ProcessCommandLine, InitiatingProcessCommandLine
| order by Timestamp desc
'@

# ── Commit and push ───────────────────────────────────────────────────────────
Write-Host "All files written. Running git add..." -ForegroundColor Cyan
git add .

Write-Host "Committing..." -ForegroundColor Cyan
git commit -m "restore: rebuild full repo after accidental deletion - includes impossible_travel.kql fix and placeholder README upgrades"

Write-Host "Pushing to GitHub..." -ForegroundColor Cyan
git push

Write-Host "Done! Repo fully restored." -ForegroundColor Green

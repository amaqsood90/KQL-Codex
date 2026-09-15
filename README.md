<div align="center">

<img src="https://raw.githubusercontent.com/amaqsood90/KQL-Codex/assets/banner.svg" alt="KQL-Codex — campaign-driven detection content for Microsoft Sentinel and Defender XDR" width="100%"/>

<br/>

<img src="https://img.shields.io/badge/Queries-56-0078D4?style=flat-square"/>
<img src="https://img.shields.io/badge/Campaigns-10-0078D4?style=flat-square"/>
<img src="https://img.shields.io/badge/ATT%26CK_Techniques-53-0078D4?style=flat-square"/>
<img src="https://img.shields.io/badge/IOC_Indicators-34-0078D4?style=flat-square"/>
<img src="https://img.shields.io/github/last-commit/amaqsood90/KQL-Codex?style=flat-square&label=last%20update&color=00BCF2"/>
<img src="https://img.shields.io/github/stars/amaqsood90/KQL-Codex?style=flat-square&color=00BCF2"/>
<img src="https://img.shields.io/badge/License-MIT-lightgrey?style=flat-square"/>

</div>

<br/>

Production-grade KQL for defenders running Microsoft Sentinel and Defender XDR. Every query is built around a threat that is actually being exploited, ships with its MITRE ATT&CK mapping in a consistent header, and is routed by the table it reads so you can find it by what you have, not by what it is called. New campaign packs land within days of public reporting.

## Latest

| Date | Pack | Coverage |
|---|---|---|
| 2026-09-14 | **[Artifactory-2026](Hunting-Queries-Detection-Rules/Campaigns/Artifactory-2026/)** | JFrog Artifactory auth-bypass chain, KEV-listed. Token minting at the WAF, Groovy plugin execution, patch-surviving persistence, C2 egress — plus 4 IOC queries backed by 34 Wiz indicators. |
| 2026-09-10 | **[MirageKitten-2026](Hunting-Queries-Detection-Rules/Campaigns/MirageKitten-2026/)** | Iran-nexus fake recruiter assessments delivering NodeRabbit and PollCat as unpublished npm dependencies. Renamed Node implants, Git-hook persistence, C2. |
| 2026-09-10 | **[GitPower-2026](Hunting-Queries-Detection-Rules/Campaigns/GitPower-2026/)** | Kimsuky LNK espionage. Space-padded PowerShell loaders, masquerading scheduled tasks, PAT-authenticated GitHub staging, console-history anti-forensics. |

## Why KQL-Codex

**Campaign-driven.** Detections are built from the reporting on a real, active threat and cover its kill chain end to end — initial access through persistence and C2 — rather than one generic pattern per file.

**Behaviour first, indicators alongside.** The core queries key on attacker behaviour that survives infrastructure rotation. Where a vendor publishes atomic indicators, they go into a version-controlled CSV under [`IOCs/`](Hunting-Queries-Detection-Rules/IOCs/) and a companion `_ioc_` query reads it at run time via `externaldata` — edit the CSV on `main` and every deployed rule picks up the change.

**Deployable as written.** One header format on every file: product, query type, ATT&CK technique, data sources, and what it detects. No placeholders, no `TODO`, no tuning homework hidden at the bottom.

**Microsoft-native.** Built exclusively on Sentinel and Defender XDR tables — `DeviceProcessEvents`, `SigninLogs`, `CommonSecurityLog`, `EmailEvents` and the rest — so a query pastes straight into advanced hunting or an analytics rule without a schema shim.

## Campaign Detection Packs

| Campaign | Threat | Detections | Techniques |
|---|---|---|---|
| [Artifactory-2026](Hunting-Queries-Detection-Rules/Campaigns/Artifactory-2026/) | CVE-2026-82329 / 42018 / 42016 — unauthenticated admin takeover of self-hosted JFrog Artifactory, multi-actor, KEV | 4 + 4 IOC | `T1190` `T1550.001` `T1059.004` `T1505` `T1098.004` `T1071.001` |
| [MirageKitten-2026](Hunting-Queries-Detection-Rules/Campaigns/MirageKitten-2026/) | Nimbus Manticore / UNC1549 fake coding assessments delivering NodeRabbit and PollCat backdoors | 4 | `T1195.002` `T1036.003` `T1053.005` `T1546` `T1071.001` `T1041` |
| [GitPower-2026](Hunting-Queries-Detection-Rules/Campaigns/GitPower-2026/) | Kimsuky LNK spearphishing with GitHub PAT-authenticated payload staging and AsyncRAT | 4 | `T1204.002` `T1027` `T1053.005` `T1036.005` `T1102` `T1070.003` |
| [AxiosRAT-2026](Hunting-Queries-Detection-Rules/Campaigns/AxiosRAT-2026/) | Sapphire Sleet / UNC1069 hijack of the axios npm maintainer account, WAVESHAPER.V2 RAT | 3 | `T1195.001` `T1071.001` `T1571` `T1105` `T1036` `T1547.001` |
| [Neusploit-2026](Hunting-Queries-Detection-Rules/Campaigns/Neusploit-2026/) | APT28 weaponisation of CVE-2026-21509 Office bypass within 72 hours, MiniDoor and PixyNetLoader | 4 | `T1203` `T1059.003` `T1137` `T1112` `T1546.015` `T1102` |
| [Tycoon2FA-2026](Hunting-Queries-Detection-Rules/Campaigns/Tycoon2FA-2026/) | Storm-1747 AiTM phishing-as-a-service intercepting session cookies at scale, disrupted March 2026 | 4 | `T1557` `T1078` `T1566.002` `T1137.005` `T1098.005` |
| [React2Shell-2025](Hunting-Queries-Detection-Rules/Campaigns/React2Shell-2025/) | CVE-2025-55182 pre-auth RCE in React Server Components, miners and Cobalt Strike via Node and Bun | 4 | `T1190` `T1059.003` `T1105` `T1071.001` `T1567.002` |
| [Shai-Hulud-2025](Hunting-Queries-Detection-Rules/Campaigns/Shai-Hulud-2025/) | Malicious npm postinstall hooks invoking secret scanners and exfiltrating to GitHub, cross-platform persistence | 11 | `T1195.002` `T1552` `T1543.002` `T1547.009` `T1568` |
| [SharePoint-2025](Hunting-Queries-Detection-Rules/Campaigns/SharePoint-2025/) | CVE-2025-53770 ToolShell chain exploited by Linen Typhoon and Violet Typhoon | 1 | `T1190` |
| [White-Lock-2025](Hunting-Queries-Detection-Rules/Campaigns/White-Lock-2025/) | Ransomware encrypting to `.fbin` and dropping `c0ntact.txt` notes | 1 | `T1486` |

## Repository Structure

> `KQL-Codex/` &nbsp;›&nbsp; `Hunting-Queries-Detection-Rules/`

<details>
<summary>📁 <b>AzureAD/</b> &nbsp;·&nbsp; Sign-ins, brute force, MFA abuse, impossible travel &nbsp;·&nbsp; <code>SigninLogs</code> <code>AuditLogs</code></summary>
</details>

<details open>
<summary>📂 <b>Campaigns/</b> &nbsp;·&nbsp; One folder per campaign with a README, kill chain, IOCs, and links to every query</summary>

<p>
&nbsp;&nbsp;&nbsp;&nbsp;• <a href="Hunting-Queries-Detection-Rules/Campaigns/Artifactory-2026/">Artifactory-2026</a> — JFrog Artifactory auth bypass chain · KEV · <code>T1190</code> <code>T1505</code> <code>T1071.001</code><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;• <a href="Hunting-Queries-Detection-Rules/Campaigns/MirageKitten-2026/">MirageKitten-2026</a> — Nimbus Manticore · fake job assessments · <code>T1195.002</code> <code>T1546</code> <code>T1041</code><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;• <a href="Hunting-Queries-Detection-Rules/Campaigns/GitPower-2026/">GitPower-2026</a> — Kimsuky LNK espionage · GitHub PAT staging · <code>T1204.002</code> <code>T1027</code> <code>T1102</code><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;• <a href="Hunting-Queries-Detection-Rules/Campaigns/AxiosRAT-2026/">AxiosRAT-2026</a> — axios npm supply chain · Sapphire Sleet · <code>T1195.001</code> <code>T1105</code> <code>T1547.001</code><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;• <a href="Hunting-Queries-Detection-Rules/Campaigns/Neusploit-2026/">Neusploit-2026</a> — APT28 · CVE-2026-21509 · <code>T1203</code> <code>T1546.015</code> <code>T1102</code><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;• <a href="Hunting-Queries-Detection-Rules/Campaigns/Tycoon2FA-2026/">Tycoon2FA-2026</a> — AiTM PhaaS · Storm-1747 · <code>T1557</code> <code>T1566.002</code><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;• <a href="Hunting-Queries-Detection-Rules/Campaigns/React2Shell-2025/">React2Shell-2025</a> — CVE-2025-55182 · Node RCE · <code>T1190</code> <code>T1059</code><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;• <a href="Hunting-Queries-Detection-Rules/Campaigns/Shai-Hulud-2025/">Shai-Hulud-2025</a> — npm supply chain abuse · <code>T1195.002</code> <code>T1552</code><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;• <a href="Hunting-Queries-Detection-Rules/Campaigns/SharePoint-2025/">SharePoint-2025</a> — CVE-2025-53770 · ToolShell · <code>T1190</code><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;• <a href="Hunting-Queries-Detection-Rules/Campaigns/White-Lock-2025/">White-Lock-2025</a> — White Lock ransomware · <code>T1486</code>
</p>

</details>

<details>
<summary>📂 <b>Cloud-Activity/</b> &nbsp;·&nbsp; Azure resource abuse, GitHub audit log hunting &nbsp;·&nbsp; <code>AzureActivity</code> <code>GitHubAudit</code></summary>

<p>&nbsp;&nbsp;&nbsp;&nbsp;📁 <b>GitHub/</b> &nbsp;·&nbsp; Worm and backdoor behaviour in the GitHub audit log</p>

</details>

<details>
<summary>📁 <b>Defender-For-Endpoint/</b> &nbsp;·&nbsp; Process, file, network, registry, and persistence detection &nbsp;·&nbsp; <code>DeviceProcessEvents</code> <code>DeviceFileEvents</code> <code>DeviceNetworkEvents</code></summary>
</details>

<details>
<summary>📁 <b>Defender-For-Identity/AD/</b> &nbsp;·&nbsp; Kerberos attacks, DCSync, AD enumeration &nbsp;·&nbsp; <code>IdentityLogonEvents</code> <code>IdentityDirectoryEvents</code></summary>
</details>

<details>
<summary>📁 <b>Defender-For-Office365/</b> &nbsp;·&nbsp; Phishing, BEC, AiTM, malicious attachments &nbsp;·&nbsp; <code>EmailEvents</code> <code>EmailUrlInfo</code></summary>
</details>

<details>
<summary>📂 <b>IOCs/</b> &nbsp;·&nbsp; Version-controlled indicator CSVs read by <code>_ioc_</code> queries at run time via <code>externaldata</code></summary>

<p>
&nbsp;&nbsp;&nbsp;&nbsp;• <a href="Hunting-Queries-Detection-Rules/IOCs/Artifactory-2026/">Artifactory-2026</a> — 34 indicators · ip · domain · url · sha1 · filepath · account<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;See the <a href="Hunting-Queries-Detection-Rules/IOCs/">IOCs README</a> for the schema and the Watchlist and Defender XDR alternatives.
</p>

</details>

<details>
<summary>📁 <b>Network-Logs/</b> &nbsp;·&nbsp; WAF, proxy, and firewall exploitation patterns &nbsp;·&nbsp; <code>CommonSecurityLog</code> <code>DnsEvents</code></summary>
</details>

<details>
<summary>📁 <b>Sentinel/</b> &nbsp;·&nbsp; UEBA anomalies, incident pivots, correlations</summary>
</details>

<details>
<summary>📁 <b>ThreatIntel-Integrations/</b> &nbsp;·&nbsp; Watchlist and IOC-driven hunting &nbsp;·&nbsp; <code>ThreatIntelligenceIndicator</code> <code>Watchlists</code></summary>
</details>

## MITRE ATT&CK Coverage

53 techniques across 13 tactics, taken from the `ATT&CK:` line of every query in the repository.

| Tactic | Techniques |
|---|---|
| Resource Development | `T1608` |
| Initial Access | `T1078` `T1190` `T1195` `T1195.002` `T1566.002` |
| Execution | `T1059` `T1059.001` `T1059.003` `T1059.004` `T1203` `T1204.002` |
| Persistence | `T1053.005` `T1098` `T1098.004` `T1098.005` `T1136` `T1136.001` `T1137` `T1137.005` `T1505` `T1543.002` `T1546` `T1546.015` `T1547.001` `T1547.009` `T1547.015` |
| Privilege Escalation | `T1055` `T1548.003` |
| Defense Evasion | `T1027` `T1036` `T1036.003` `T1036.005` `T1070.003` `T1070.004` `T1112` `T1550.001` `T1564.001` |
| Credential Access | `T1110` `T1552` `T1557` |
| Discovery | `T1082` |
| Lateral Movement | `T1021` |
| Collection | `T1005` |
| Command and Control | `T1071` `T1071.001` `T1102` `T1105` `T1568` `T1571` |
| Exfiltration | `T1041` `T1567.002` |
| Impact | `T1486` |

## Query Standard

Every `.kql` file opens with the same seven-line header, so you know what a query needs and what it does before reading a line of logic.

```kql
// Title:        Operation GitPower — LNK-Triggered Padded PowerShell Loader
// Product:      MDE
// Query Type:   Threat Hunting
// ATT&CK:       T1204.002 (User Execution: Malicious File), T1027 (Obfuscated Files or Information)
// Data Sources: DeviceProcessEvents
// Description:  Detects PowerShell launched from Explorer with a command line padded by dozens of
//               leading spaces or carrying a space-delimited decimal array payload.
// Author:       Ahsan M.
```

`Product` is one of `Sentinel` · `MDE` · `MDI` · `MDO` · `Entra ID`. `Query Type` is `Detection Rule` for logic tight enough to alert on, `Threat Hunting` for logic that needs an analyst behind it. Inline comments appear only where the KQL genuinely needs explaining — there are no tuning or validation blocks to maintain, the header carries everything.

## Quick Start

```bash
git clone https://github.com/amaqsood90/KQL-Codex.git
```

1. Open the folder matching the table you have — `Defender-For-Endpoint/` for MDE, `AzureAD/` for Entra sign-ins, and so on — or start from a campaign README to see the full kill chain.
2. Paste the query into Defender XDR advanced hunting or the Sentinel Logs pane.
3. For `Detection Rule` queries, create an analytics rule or custom detection from the same text. For `Threat Hunting` queries, review results with an analyst before alerting.
4. For `_ioc_` queries, note that `externaldata` runs in Sentinel but not the Defender XDR portal — the [IOCs README](Hunting-Queries-Detection-Rules/IOCs/) covers the Watchlist and custom-indicator alternatives.

## Contributing

Contributions are welcome. Fork, branch, follow the header standard above, test in a non-production workspace, and open a pull request that names the threat or behaviour being detected. A new campaign pack needs a `README.md` in its folder describing the threat, the platforms it hits, and how the queries fit together.

<details>
<summary><b>Threat intelligence sources used when building packs</b></summary>
<br/>

**Microsoft** — [Security Blog](https://www.microsoft.com/en-us/security/blog/) · [Threat Intelligence](https://ti.defender.microsoft.com/) · [MSRC Update Guide](https://msrc.microsoft.com/update-guide/)

**Research** — [CISA Advisories](https://www.cisa.gov/news-events/cybersecurity-advisories) · [Unit 42](https://unit42.paloaltonetworks.com/) · [CrowdStrike](https://www.crowdstrike.com/blog/category/threat-intelligence/) · [Elastic Security Labs](https://www.elastic.co/security-labs) · [Recorded Future](https://www.recordedfuture.com/blog) · [Wiz Research](https://www.wiz.io/blog) · [Kaspersky Securelist](https://securelist.com/)

**Vulnerabilities** — [NVD](https://nvd.nist.gov/) · [CVE.org](https://www.cve.org/) · [CISA KEV](https://www.cisa.gov/known-exploited-vulnerabilities-catalog)

**News** — [BleepingComputer](https://www.bleepingcomputer.com/) · [The Hacker News](https://thehackernews.com/) · [Krebs on Security](https://krebsonsecurity.com/) · [Dark Reading](https://www.darkreading.com/)

**Indicators** — [VirusTotal](https://www.virustotal.com/) · [URLhaus](https://urlhaus.abuse.ch/) · [MalwareBazaar](https://bazaar.abuse.ch/) · [OTX](https://otx.alienvault.com/)

</details>

<details>
<summary><b>KQL and platform references</b></summary>
<br/>

[KQL reference](https://docs.microsoft.com/en-us/azure/data-explorer/kusto/query/) · [Advanced hunting schema](https://docs.microsoft.com/en-us/microsoft-365/security/defender/advanced-hunting-schema-tables) · [Sentinel documentation](https://docs.microsoft.com/en-us/azure/sentinel/) · [MITRE ATT&CK](https://attack.mitre.org/) · [KQL playground](https://aka.ms/LADemo) · [Must Learn KQL](https://aka.ms/MustLearnKQL)

</details>

---

<div align="center">

MIT licensed. Maintained by Ahsan M. — if this saves you time on a hunt, a star helps others find it.

</div>

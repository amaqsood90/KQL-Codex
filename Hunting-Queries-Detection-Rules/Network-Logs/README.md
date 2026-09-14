# Network Logs

DNS, proxy, WAF, and firewall-based hunting queries built on `CommonSecurityLog` and `DnsEvents`.

## Queries

| File | Detects | ATT&CK |
|---|---|---|
| [sharepoint_cve_2025_53770_toolpane_exploit.kql](sharepoint_cve_2025_53770_toolpane_exploit.kql) | Exploit request patterns to the vulnerable SharePoint ToolPane.aspx endpoint (ToolShell) | `T1190` |
| [artifactory_token_endpoint_exploitation.kql](artifactory_token_endpoint_exploitation.kql) | JFrog Artifactory auth bypass chain at the WAF — 401-then-200 slash-variant probe, token scope escalation, join-key abuse, plugin deployment | `T1190` `T1550.001` |

## Planned Coverage

- DNS tunneling detection
- Suspicious proxy traffic
- Beaconing pattern detection
- Long connection duration anomalies
- Domain generation algorithm (DGA) detection

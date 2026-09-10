# GitPower-2026 — Kimsuky LNK Espionage with GitHub PAT Staging (Operation GitPower)

North Korea-nexus threat actor Kimsuky (also tracked as APT43, Emerald Sleet, Velvet Chollima) has expanded Operation GitPower, a spearphishing campaign that delivers Windows shortcut files inside ZIP archives and stages every follow-on payload in private GitHub repositories. The operation now incorporates a local AI development environment — the OpenCode coding agent is used to mass-produce decoy documents, leaving `opencode` in PDF Creator/Producer metadata and `anonymous` in the Author field.

**Kill chain:** Spearphishing ZIP → LNK masquerading as a Hangul document (Chrome icon, forged 2023 timestamps, 319 KB–8.9 MB of pseudorandom padding after the valid shortcut structure) → `explorer.exe` launches PowerShell with ~300 leading spaces hiding the command → custom decoder reconstructs a second stage from a space-delimited decimal array → `.ps1` written to AppData and run via `Invoke-Expression` → scheduled task named after a system component (`BitLockor`, .NET Framework NGEN, MATLAB) re-runs hidden PowerShell on an interval → payloads pulled from private GitHub repos with `Authorization: token <PAT>` and `Accept: application/vnd.github.v3.raw` (Pastebin as backup) → AsyncRAT → PSReadLine history deleted

**Objective:** Espionage — South Korean government, academia, diplomacy, military, security research, international cooperation, and virtual asset organizations, with decoy themes now expanded to financial institutions and corporate personnel

**Notable tradecraft:** The PAT-authenticated GitHub channel means domain-based blocking of `raw.githubusercontent.com` is ineffective in most enterprises, since the same domain carries legitimate developer traffic. The loader also fingerprints analysis tooling (VMware, Process Hacker, x64dbg, PE-bear, Autoruns, Process Explorer, Procmon, TCPView) and the sandbox username `Bruno`, self-terminating and removing artifacts on a hit.

## Queries

- **MDE:** [gitpower_lnk_padded_powershell.kql](../../Defender-For-Endpoint/gitpower_lnk_padded_powershell.kql) — Explorer-spawned PowerShell with heavy space padding or a decimal-array payload `T1204.002` `T1027`
- **MDE:** [gitpower_masquerading_scheduled_task.kql](../../Defender-For-Endpoint/gitpower_masquerading_scheduled_task.kql) — Scheduled tasks impersonating BitLocker, NGEN, or MATLAB that launch PowerShell `T1053.005` `T1036.005`
- **MDE:** [gitpower_github_pat_payload_retrieval.kql](../../Defender-For-Endpoint/gitpower_github_pat_payload_retrieval.kql) — Token-authenticated raw GitHub and Pastebin payload retrieval `T1102` `T1105`
- **MDE:** [gitpower_psreadline_history_deletion.kql](../../Defender-For-Endpoint/gitpower_psreadline_history_deletion.kql) — Console history removal by a scripting host after execution `T1070.003`

## MITRE ATT&CK

| Technique | Name | Covered |
|---|---|---|
| T1566.001 | Phishing: Spearphishing Attachment | Context |
| T1204.002 | User Execution: Malicious File | Query 1 |
| T1027 | Obfuscated Files or Information | Query 1 |
| T1059.001 | Command and Scripting Interpreter: PowerShell | Query 1, Query 2 |
| T1140 | Deobfuscate/Decode Files or Information | Context |
| T1053.005 | Scheduled Task/Job: Scheduled Task | Query 2 |
| T1036.005 | Masquerading: Match Legitimate Name or Location | Query 2 |
| T1102 | Web Service (GitHub, Pastebin) | Query 3 |
| T1105 | Ingress Tool Transfer | Query 3 |
| T1071.001 | Application Layer Protocol: Web Protocols | Query 3 |
| T1608.004 | Stage Capabilities: Drive-by Target (GitHub staging) | Context |
| T1070.003 | Indicator Removal: Clear Command History | Query 4 |
| T1497 | Virtualization/Sandbox Evasion | Context |

## Key IOCs

**LNK characteristics:** ~300 leading spaces before the command, ~3,800 character command lines, Chrome path as icon source, forged 2023 modification timestamps, 319 KB–8.9 MB file size from trailing pseudorandom padding
**Encoding:** Space-delimited decimal array (not Base64) with a custom PowerShell decoder; shared variable naming and arithmetic constant across samples
**Scheduled task names:** `BitLockor` (misspelled), .NET Framework NGEN jobs, MATLAB-themed jobs
**Staging:** `api.github.com` / `raw.githubusercontent.com` with `Authorization: token <PAT>` and `Accept: application/vnd.github.v3.raw`; Pastebin as backup channel
**Host artifacts:** `.ps1` dropped under AppData, `conhost.exe --headless` activity, `ConsoleHost_history.txt` deleted post-execution
**Decoy metadata:** `opencode` in PDF Creator/Producer, Author `anonymous`, `(placeholder)` text from incomplete LLM drafts, HeadlessChrome and Skia/PDF rendering markers
**Payload:** AsyncRAT

## References

- [Kimsuky Uses the AI Agent 'opencode' to Create Decoys as Its GitHub PAT-Based LNK Attacks Evolve](https://www.genians.co.kr/en/blog/threat_intelligence/ai-agent-opencode) — Genians Security Center
- [Kimsuky Integrates AI into Attack Operations, From AI-Generated Decoy Documents to a Local LLM](https://www.genians.co.kr/en/blog/threat_intelligence/kimsuky_ai_llm) — Genians Security Center
- [Kimsuky Uses OpenCode AI Agent and GitHub PATs in Operation GitPower Attacks](https://gbhackers.com/operation-gitpower-campaign/) — GBHackers
- [Kimsuky Expands Its Cyber Espionage Arsenal With Local AI Development Environment](https://cybersecuritynews.com/kimsuky-expands-its-cyber/) — Cybersecurity News

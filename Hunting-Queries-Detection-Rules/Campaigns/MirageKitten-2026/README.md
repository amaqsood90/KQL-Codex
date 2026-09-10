# MirageKitten-2026 — Fake Coding Assessments Delivering NodeRabbit and PollCat

Iran-nexus threat actor Mirage Kitten (also tracked as Nimbus Manticore and UNC1549) targets software engineers with fake recruiter accounts on job search platforms. Targets are invited to complete a technical assessment hosted on Amazon S3; the archive contains a working coding challenge with a backdoor bundled as a local npm dependency that was never published to the registry. Kaspersky attributes the activity to a campaign against aviation and FinTech organizations across the Middle East and Africa.

**Kill chain:** Fake recruiter contact on a job platform → S3-hosted coding challenge archive → trojanized local npm package imported on the first line of the project (`colorized_terminal@2.1.0`, `pretty-log@2.1.0`) → NodeRabbit launches detached from `node_modules/.cache/.320697f1/index.js` → `node.exe` copied to `nodew.exe` or `IntelDSA.exe` with the PE subsystem flipped to Windows GUI so no console window appears → persistence via branded scheduled tasks, Run key, Git hooks, cron, or LaunchAgents → HTTPS beaconing with AES-256-GCM encrypted bodies to Azure Websites and lookalike domains

**PollCat variant:** Delivered as a React challenge (`RankChallenge-react`) that demands a six-digit access code from the recruiter behind a countdown timer. The implant loads through `app.js` → `requireAuth.js` → `requireObjects.js` and begins talking to its C2 the moment the app loads — well before the victim enters the code.

**Objective:** Espionage and access development against aviation and FinTech engineering staff, with credential theft (including Outlook credentials via PollCat) and hands-on-keyboard tasking

**Notable tradecraft:** The challenge README imposes a three-hour time limit and explicitly prohibits AI assistants — the authors correctly judged that an AI code reviewer would flag the unknown first-line package import. The Git hook persistence is the standout defender problem: removing the malicious package does not remove the implant, because `.git/hooks/post-merge` re-establishes it on the next pull.

## Queries

- **MDE:** [mirage_kitten_renamed_node_implant.kql](../../Defender-For-Endpoint/mirage_kitten_renamed_node_implant.kql) — Renamed Node runtime and execution from the package cache or masquerade paths `T1036.003` `T1195.002`
- **MDE:** [mirage_kitten_branded_task_persistence.kql](../../Defender-For-Endpoint/mirage_kitten_branded_task_persistence.kql) — Scheduled tasks impersonating Edge Update, Intel DSA, and NetSync `T1053.005` `T1036.005`
- **MDE:** [mirage_kitten_git_hook_persistence.kql](../../Defender-For-Endpoint/mirage_kitten_git_hook_persistence.kql) — Git hook scripts written by anything other than Git `T1546` `T1195.002`
- **MDE:** [mirage_kitten_c2_beacon.kql](../../Defender-For-Endpoint/mirage_kitten_c2_beacon.kql) — Known C2 hosts and the fixed NodeRabbit / PollCat API paths `T1071.001` `T1041`

## MITRE ATT&CK

| Technique | Name | Covered |
|---|---|---|
| T1566.002 | Phishing: Spearphishing Link (job platforms) | Context |
| T1195.002 | Supply Chain Compromise: Compromise Software Supply Chain | Query 1, Query 3 |
| T1204.002 | User Execution: Malicious File | Context |
| T1036.003 | Masquerading: Rename System Utilities | Query 1 |
| T1036.005 | Masquerading: Match Legitimate Name or Location | Query 2 |
| T1053.005 | Scheduled Task/Job: Scheduled Task | Query 2 |
| T1547.001 | Boot or Logon Autostart: Registry Run Keys | Context |
| T1547.014 | Boot or Logon Autostart: LaunchAgent (macOS) | Context |
| T1546 | Event Triggered Execution (Git hooks) | Query 3 |
| T1071.001 | Application Layer Protocol: Web Protocols | Query 4 |
| T1041 | Exfiltration Over C2 Channel | Query 4 |
| T1571 | Non-Standard Port (41984 + agent_id mod 5000) | Context |
| T1555.003 | Credentials from Web Browsers / Outlook (PollCat) | Context |
| T1562.008 | Impair Defenses: Disable Cloud Logs (24 vendor folder scan) | Context |
| T1057 | Process Discovery (`proc:list`) | Context |
| T1083 | File and Directory Discovery (`fs:list`) | Context |

## Key IOCs

**Trojanized packages:** `colorized_terminal@2.1.0`, `pretty-log@2.1.0` (bundled locally, never published to npm)
**Implant path:** `node_modules/.cache/.320697f1/index.js`
**Renamed binaries:** `nodew.exe`, `IntelDSA.exe` (copies of `node.exe`, PE subsystem set to GUI)
**Windows install paths:** `%APPDATA%\Microsoft\EdgeUpdate\`, `%LOCALAPPDATA%\Intel\DSA\`, `%APPDATA%\Microsoft\Network`
**Linux paths:** `~/.config/microsoft-edge-update/`, `~/.config/intel-dsa/`, `~/.node_packages`, `~/.local/share`
**macOS paths:** `~/Library/LaunchAgents/`, `~/Library/Application Support/`
**Scheduled tasks:** `MicrosoftEdgeUpdate`, `IntelDriverSupportUpdate`, `NetSync_<username>` (daily 09:00 and 10:00, `/ru SYSTEM /rl highest`)
**Git hook marker:** `# shepherd-persist;` appended to `.git/hooks/post-merge` and `post-checkout`
**Other persistence:** VS Code extension masquerading as `GitHub Copilot Helper`; WSL `launcher.vbs` stub
**NodeRabbit C2:** `plugplay.azurewebsites[.]net`, `rgbteller.azurewebsites[.]net`, `wslwebui.azurewebsites[.]net`, `visitfinancedentists[.]com`, `healthcomfsdpower[.]com`, `kyrasey-f8hfexa5cqamh7fk.westeurope-01.azurewebsites[.]net`
**PollCat C2:** `sahi-finance[.]com`, `gamebarappinformation.azurewebsites[.]net`, `gamebarapp.azurewebsites[.]net`
**API paths:** `/api/rabbit/checkin`, `/api/rabbit/task`, `/sdk/v2/ready`, `/beacon`, `/gate/hello`, `/gate/fetch?token=<socketId>`
**Local artifacts:** `.sv.json` config files holding the C2 server list; TCP listener on `127.0.0.1:48739` for the single-instance check

## References

- [Mirage Kitten switches to Node.js and JavaScript malware](https://securelist.com/mirage-kitten-new-backdoors-noderabbit-pollcat/121244/) — Kaspersky Securelist
- [Iran-linked APT Mirage Kitten Uses Fake Job Tests to Spread Malware](https://securityaffairs.com/198289/apt/iran-linked-apt-mirage-kitten-uses-fake-job-tests-to-spread-malware.html) — Security Affairs
- [Mirage Kitten Hackers Use Fake Coding Challenges to Deploy NodeRabbit and PollCat RATs](https://gbhackers.com/mirage-kitten-campaign/) — GBHackers
- [Mirage Kitten Malware Targets Aviation and Fintech Sectors](https://securityonline.info/mirage-kitten-malware-noderabbit-pollcat/) — Security Online

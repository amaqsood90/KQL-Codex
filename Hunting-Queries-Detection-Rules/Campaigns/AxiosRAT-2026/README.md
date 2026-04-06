# AxiosRAT-2026 — Axios npm Supply Chain Compromise (Sapphire Sleet / UNC1069)

North Korea-nexus threat actor UNC1069 (also tracked as Sapphire Sleet, BlueNoroff) compromised the npm maintainer account `jasonsaayman` and published backdoored versions of the widely-used `axios` library on March 31, 2026. The attack was live for approximately 3 hours (00:21–03:25 UTC), during which any environment running `npm install` against `axios@1.14.1` or `axios@0.30.4` executed a malicious postinstall hook.

**Kill chain:** Maintainer account hijack → backdoored `axios@1.14.1` / `axios@0.30.4` published with `plain-crypto-js@4.2.1` dependency → `postinstall` hook executes `setup.js` (multi-layer obfuscated dropper: Base64 + string reversal + XOR `OrDeR_7077`) → OS-specific WAVESHAPER.V2 / NukeSped RAT downloaded from `sfrclak[.]com:8000` → RAT beacons every 60 seconds with system telemetry and awaits commands → Windows persistence via `MicrosoftUpdate` Run key writing `C:\ProgramData\system.bat`

**Objective:** Financial — exfiltration of cryptocurrency wallets, API keys, AWS credentials, and SSH keys from developer machines and CI/CD infrastructure

**Affected packages:** `axios@1.14.1`, `axios@0.30.4`, `plain-crypto-js@4.2.1`
**Safe versions:** `axios@1.14.0` and below, `axios@0.30.3` and below

## Queries

- **MDE:** [axios_c2_network_ioc.kql](../../Defender-For-Endpoint/axios_c2_network_ioc.kql) — Outbound connections to C2 domains and IPs used for RAT beaconing `T1071.001` `T1571`
- **MDE:** [axios_malicious_file_artifacts.kql](../../Defender-For-Endpoint/axios_malicious_file_artifacts.kql) — File creation of known RAT payloads, dropper artifacts, and masqueraded binaries `T1105` `T1036`
- **MDE:** [axios_registry_persistence.kql](../../Defender-For-Endpoint/axios_registry_persistence.kql) — MicrosoftUpdate Run key persistence written by the Windows RAT `T1547.001`

## MITRE ATT&CK

| Technique | Name | Covered |
|---|---|---|
| T1195.001 | Supply Chain Compromise: Software Dependencies | Context |
| T1072 | Software Deployment Tools (npm postinstall) | Context |
| T1071.001 | Application Layer Protocol: Web Protocols | Query 1 |
| T1571 | Non-Standard Port (port 8000) | Query 1 |
| T1105 | Ingress Tool Transfer | Query 2 |
| T1036 | Masquerading (wt.exe, com.apple.act.mond, ld.py) | Query 2 |
| T1547.001 | Registry Run Keys / Startup Folder | Query 3 |
| T1140 | Deobfuscate/Decode Files | Context |
| T1070.004 | Indicator Removal: File Deletion | Context |

## Key IOCs

**Malicious packages:** `axios@1.14.1`, `axios@0.30.4`, `plain-crypto-js@4.2.1`
**C2 domains:** `sfrclak[.]com`, `callnrwise[.]com`, `calltan[.]com`
**C2 IPs:** `142.11.206.73`, `23.254.167.216`
**C2 beacon:** `hxxp://sfrclak[.]com:8000/6202033` (HTTP POST, 60-second interval)

## References

- [Mitigating the Axios npm supply chain compromise](https://www.microsoft.com/en-us/security/blog/2026/04/01/mitigating-the-axios-npm-supply-chain-compromise/) — Microsoft Security Blog, April 1, 2026
- [Inside the Axios supply chain compromise - one RAT to rule them all](https://www.elastic.co/security-labs/axios-one-rat-to-rule-them-all) — Elastic Security Labs
- [Compromised axios npm package delivers cross-platform RAT](https://securitylabs.datadoghq.com/articles/axios-npm-supply-chain-compromise/) — Datadog Security Labs
- [Supply Chain Compromise of axios npm Package](https://www.huntress.com/blog/supply-chain-compromise-axios-npm-package) — Huntress
- [North Korea-Nexus Threat Actor Compromises Widely Used Axios NPM Package](https://cloud.google.com/blog/topics/threat-intelligence/north-korea-threat-actor-targets-axios-npm-package) — Google Cloud / GTIG

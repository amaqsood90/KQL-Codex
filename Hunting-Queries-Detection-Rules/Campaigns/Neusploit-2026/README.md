# Neusploit-2026 — APT28 CVE-2026-21509 Espionage Campaign

Russia-linked APT28 (Fancy Bear / UAC-0001) weaponized CVE-2026-21509, a Microsoft Office security feature bypass, within 72 hours of its public disclosure on January 26, 2026. The campaign targeted government, military, and critical infrastructure organizations across Ukraine, Slovakia, Romania, Poland, and other Central and Eastern European nations using localized spearphishing lures.

**Kill chain:** Spearphishing email with malicious RTF/Word document → CVE-2026-21509 triggered on open (no macro interaction required) → WebDAV download of dropper DLL → two paths: (A) MiniDoor Outlook VBA backdoor installs, lowers macro security via registry, silently forwards inbox/drafts/junk emails to attacker-controlled addresses; (B) PixyNetLoader deploys EhStoreShell.dll via COM hijacking, extracts Covenant Grunt shellcode from a PNG via LSB steganography, establishes persistent C2 to filen.io cloud storage API

**Objective:** Intelligence collection — email theft, long-term access, lateral movement via Covenant Grunt post-exploitation framework

## Queries

- **MDE:** [neusploit_office_child_process.kql](../../Defender-For-Endpoint/neusploit_office_child_process.kql) — Office process spawning suspicious child processes post-exploitation `T1203` `T1059.003`
- **MDE:** [neusploit_outlook_registry_tamper.kql](../../Defender-For-Endpoint/neusploit_outlook_registry_tamper.kql) — Outlook VBA security registry keys modified by MiniDoor `T1137` `T1112`
- **MDE:** [neusploit_com_hijack_persistence.kql](../../Defender-For-Endpoint/neusploit_com_hijack_persistence.kql) — COM hijacking via HKCU CLSID registry for PixyNetLoader persistence `T1546.015`
- **MDE:** [neusploit_covenant_c2_filen.kql](../../Defender-For-Endpoint/neusploit_covenant_c2_filen.kql) — Outbound connections to filen.io cloud C2 infrastructure `T1071.001` `T1102`

## References

- [Operation Neusploit: APT28 Leverages CVE-2026-21509](https://www.zscaler.com/blogs/security-research/apt28-leverages-cve-2026-21509-operation-neusploit) — Zscaler ThreatLabz, February 3, 2026
- [APT28 Multi-Stage Campaign Leveraging CVE-2026-21509 and Cloud C2 Infrastructure](https://www.trellix.com/blogs/research/apt28-stealthy-campaign-leveraging-cve-2026-21509-cloud-c2/) — Trellix Advanced Research Center, February 4, 2026
- [APT28 Uses Microsoft Office CVE-2026-21509 in Espionage-Focused Malware Attacks](https://thehackernews.com/2026/02/apt28-uses-microsoft-office-cve-2026.html) — The Hacker News, February 4, 2026

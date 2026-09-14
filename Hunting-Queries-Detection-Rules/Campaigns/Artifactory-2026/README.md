# Artifactory-2026 — In-the-Wild Exploitation of JFrog Artifactory (CVE-2026-82329 / 42018 / 42016)

Between 15 August and 8 September 2026, multiple unattributed actors chained three JFrog Artifactory authentication flaws against self-hosted instances to mint admin tokens without credentials, deploy malicious Groovy user plugins for code execution, create persistent admin accounts, and drop a Rust backdoor. Wiz Research and watchTowr both describe several distinct operators working the same bugs concurrently — opportunistic mass exploitation alongside at least one actor doing hands-on-keyboard triage of high-value targets. CISA added CVE-2026-82329 to the KEV catalog on 3 September 2026, four days after JFrog's patch and before most shops had a maintenance window. JFrog Cloud is not affected.

**Kill chain:** POST `/access/api/v1/aws/token` → 401, then the trailing-slash variant `/access/api/v1/aws/token/` → 200 with an internal anonymous-user JWT (CVE-2026-42018) → POST `/access/api/v1/tokens` exchanges it for an admin-scoped token because scope is never validated (CVE-2026-42016) → *or* sign a cluster-join JWT with the default empty join key and POST `/access/api/v1/registry/join` for a non-expiring admin SERVICE token (CVE-2026-82329) → PUT `/api/security/users/<name>` creates persistent admin accounts named after JFrog service identities → malicious Groovy plugin deployed via `/artifactory/api/plugins` → shell commands driven through `/api/plugins/execute/<plugin>` as children of the Artifactory JVM → second-stage payload fetched over HTTP to `/tmp/.z`, `/dev/shm` or `/var/tmp` → Rust backdoor with C2, SSH keys on the new accounts, webshells in repository paths → Artifactory configuration and cluster join keys stolen

**Objective:** Supply chain positioning. Artifactory fronts every build in the estate — Maven, npm, Docker, NuGet — so admin there is the ability to replace artifacts CI/CD pulls and production runs, plus access to the credential store CI uses to reach everything else.

**Notable tradecraft:** Persistence survives patching. A `.groovy` file in `$JFROG_HOME/artifactory/var/etc/artifactory/plugins` is loaded at every startup and an in-place upgrade removes the entry path and nothing else. Stolen join keys let the actors re-mint admin tokens on a patched instance. If the only response was "we patched", the host is likely still owned — rotate the join key and all access tokens regardless of patch status.

**Affected:** < 7.111.21 · 7.117.0–7.117.27 · 7.125.0–7.125.19 · 7.133.0–7.133.28 · 7.146.0–7.146.37 · 7.161.0–7.161.19

## Queries

- **Sentinel:** [artifactory_token_endpoint_exploitation.kql](../../Network-Logs/artifactory_token_endpoint_exploitation.kql) — 401-then-200 slash-variant probe, token scope escalation chain, join-key abuse, and plugin deployment at the WAF/proxy `T1190` `T1550.001`
- **MDE:** [artifactory_service_child_process_execution.kql](../../Defender-For-Endpoint/artifactory_service_child_process_execution.kql) — Artifactory JVM spawning shells, downloaders, or chmod against world-writable paths `T1059.004` `T1105`
- **MDE:** [artifactory_groovy_plugin_persistence.kql](../../Defender-For-Endpoint/artifactory_groovy_plugin_persistence.kql) — Groovy plugin drops, SSH key writes, systemd/cron units, and account tamper from the Artifactory tree `T1505` `T1098.004` `T1543.002`
- **MDE:** [artifactory_backdoor_c2_egress.kql](../../Defender-For-Endpoint/artifactory_backdoor_c2_egress.kql) — Non-JFrog processes on JFrog hosts beaconing to public IPs from world-writable paths `T1071.001` `T1041`

## IOC Queries

These read the 34 indicators Wiz published from [IOCs/Artifactory-2026/artifactory_2026_iocs.csv](../../IOCs/Artifactory-2026/artifactory_2026_iocs.csv) at run time via `externaldata`, so updating the CSV on `main` updates every deployed rule. Sentinel / Log Analytics only — see the [IOCs README](../../IOCs/README.md) for the Watchlist and Defender XDR alternatives.

- **Sentinel:** [artifactory_ioc_exploitation_source_ips.kql](../../Network-Logs/artifactory_ioc_exploitation_source_ips.kql) — Inbound requests from the 17 exploitation source IPs, payload host, or C2 server `T1190`
- **Sentinel:** [artifactory_ioc_backdoor_account_creation.kql](../../Network-Logs/artifactory_ioc_backdoor_account_creation.kql) — PUT to the users API creating one of the 10 named backdoor accounts or a `svc_`/`Nxploited_`/`labadmin_` generated name `T1136.001` `T1098`
- **Sentinel:** [artifactory_ioc_c2_payload_egress.kql](../../Defender-For-Endpoint/artifactory_ioc_c2_payload_egress.kql) — Outbound connections to `log.gitclone.org`, the second-stage server, C2, or any actor IP `T1105` `T1071.001`
- **Sentinel:** [artifactory_ioc_payload_hash_and_path.kql](../../Defender-For-Endpoint/artifactory_ioc_payload_hash_and_path.kql) — File writes or executions matching the payload SHA1 or the `/tmp/.z` drop path `T1105` `T1564.001`

## MITRE ATT&CK

| Technique | Name | Covered |
|---|---|---|
| T1190 | Exploit Public-Facing Application | Query 1 |
| T1550.001 | Use Alternate Authentication Material: Application Access Token | Query 1 |
| T1059.004 | Command and Scripting Interpreter: Unix Shell | Query 2 |
| T1105 | Ingress Tool Transfer | Query 2 |
| T1505 | Server Software Component (Groovy user plugin) | Query 3 |
| T1098.004 | Account Manipulation: SSH Authorized Keys | Query 3 |
| T1543.002 | Create or Modify System Process: Systemd Service | Query 3 |
| T1136.001 | Create Account: Local Account | IOC Query 2 |
| T1098 | Account Manipulation | IOC Query 2 |
| T1071.001 | Application Layer Protocol: Web Protocols | Query 4, IOC Query 3 |
| T1041 | Exfiltration Over C2 Channel | Query 4 |
| T1564.001 | Hide Artifacts: Hidden Files and Directories | IOC Query 4 |
| T1552 | Unsecured Credentials (join key, config theft) | Context |

## Key IOCs

**Abused endpoints:** `POST /access/api/v1/aws/token/` (42018), `POST /access/api/v1/tokens` (42016), `POST /access/api/v1/registry/join` (82329), `PUT /api/security/users/<name>` and `PUT /access/api/ui/users/<name>` (account creation), `GET|POST /api/plugins/execute/<plugin>` (command execution), `GET /access/api/v1/system/security/join_key` (key theft), `GET /api/system/configuration` (config exfil)
**Backdoor accounts:** `jfrog-distribution`, `jfrog-insight`, `jfrog-mission-control`, `jfrog-pipeline`, `repo-service`, `backup-service`, `migration-tool`, `ldap_admin`, `ldap_administrator`, `0xterror`; generated patterns `svc_[a-zA-Z0-9]{8}`, `Nxploited_[a-zA-Z0-9]{3}`, `labadmin_[a-zA-Z0-9]{10}`
**Plugin path:** `$JFROG_HOME/artifactory/var/etc/artifactory/plugins/*.groovy` (default `/opt/jfrog/artifactory/var/etc/artifactory/plugins/`)
**Staging paths:** `/tmp/.z`, `/dev/shm`, `/var/tmp`
**Payload:** SHA1 `513a907b69edffc3cb77a494da395178d21ef9bd` (`/tmp/.z`)
**Network:** `log.gitclone[.]org:45678` (payload), `3.88.162[.]79:36789` (second stage), `64.207.232[.]6:8443` (C2), plus 17 exploitation source IPs

## Deployment Notes

- Query 1 depends on the WAF/proxy preserving the full URI path in `RequestURL`. Validate with `CommonSecurityLog | where RequestURL has "artifactory" | take 20` — if paths are truncated to the host, ship Artifactory's `access.log` in as a custom table instead.
- Queries 2–4 assume the Artifactory host is MDE-onboarded. If it isn't, that is the single highest-value onboarding to do.
- Query 4's exclusion list assumes a default `/opt/jfrog` install — adjust the three `!has` clauses to the actual `$JFROG_HOME` or the JVM's own egress will be noisy.
- Not expressible in KQL but do it by hand: grep Artifactory's access log for `token:anonymous` performing admin operations, list admin accounts against the names above, and physically inspect the plugins directory for `.groovy` files you did not put there.

## References

- [Artifactory Under Attack: In-the-Wild Exploitation of CVE-2026-42016, CVE-2026-42018 & CVE-2026-82329](https://www.wiz.io/blog/artifactory-under-attack-in-the-wild-exploitation-of-cve-2026-42016-cve-2026-4201) — Wiz Research
- [CVE-2026-82329: Unauthenticated Administrative Access in JFrog Artifactory via an Empty Cluster Join Key](https://bishopfox.com/blog/cve-2026-82329-unauthenticated-administrative-access-in-jfrog-artifactory-via-an-empty-cluster-join-key) — Bishop Fox
- [Artifactory flaws chained in attacks deploying backdoor malware](https://www.bleepingcomputer.com/news/security/artifactory-flaws-chained-in-attacks-deploying-backdoor-malware/) — BleepingComputer
- [Three JFrog Artifactory Flaws Exploited for Backdoor Deployment](https://www.securityweek.com/three-jfrog-artifactory-flaws-exploited-for-backdoor-deployment/) — SecurityWeek
- [CISA Added JFrog Artifactory Vulnerability to KEV (CVE-2026-82329)](https://threatprotect.qualys.com/2026/09/03/cisa-added-jfrog-artifactory-vulnerability-to-its-known-exploited-vulnerabilities-catalog-cve-2026-82329/) — Qualys
- [User Plugins](https://docs.jfrog.com/integrations/docs/user-plugins) — JFrog documentation

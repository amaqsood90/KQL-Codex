# React2Shell CVE‑2025‑55182 Campaign (2025)

This campaign addresses the **React2Shell** vulnerability (CVE‑2025‑55182) affecting React Server Components.  The flaw allows a remote unauthenticated attacker to execute arbitrary code by crafting malicious HTTP requests that abuse the `next‑action` and `rsc‑action‑id` headers.  Attackers have exploited the bug since early December 2025 to deploy **crypto‑miners**, **Cobalt Strike** beacons, **Sliver** payloads and the **Secret‑Hunter** toolkit.  The latter installs tools such as **TruffleHog** and **Gitleaks**, uses Cloudflare tunnels (`trycloudflare.com`) and the `C3pool` mining pool, harvests cloud instance metadata (169.254.169.254) and exfiltrates secrets【677298509385333†L1330-L1360】【894970168289148†L246-L354】.  Microsoft and Gopher Security report that scanning and exploitation began within hours of disclosure, with hundreds of millions of hits recorded【894970168289148†L65-L144】.

The following KQL queries help defenders detect the various stages of the React2Shell exploitation chain in Microsoft Defender for Endpoint and Microsoft Sentinel.  They focus on behaviour rather than brittle indicators and can be tuned for the environment.  See each file for tuning and validation guidance.

## Queries in this campaign

- **[react2shell_node_execution_detection.kql](react2shell_node_execution_detection.kql)** – identifies suspicious Node/Bun processes executing commands associated with React2Shell payloads (e.g., downloading DLLs, running cryptominers, invoking `trufflehog` or `gitleaks`).
- **[react2shell_http_header_exploitation.kql](react2shell_http_header_exploitation.kql)** – looks for HTTP requests with the `next‑action` or `rsc‑action‑id` headers or `$@` patterns indicative of the exploit, using web or application firewall logs.
- **[react2shell_c2_and_metadata_detection.kql](react2shell_c2_and_metadata_detection.kql)** – flags outbound connections to known threat infrastructure (`trycloudflare.com`, `c3pool`, specific IP addresses) and metadata endpoints, which attackers use for exfiltration and command‑and‑control【677298509385333†L1330-L1360】【894970168289148†L246-L354】.
- **[react2shell_temp_file_creation.kql](react2shell_temp_file_creation.kql)** – detects suspicious file writes in temporary directories (e.g., `/tmp`, `C:\\Windows\\Temp`) involving payloads like `healthcheck.dll`, `setup_c3pool_miner.bat` or the malicious Node scripts【677298509385333†L1330-L1360】.

Use these detections as a starting point and adapt them to your organisation’s logging sources and environment.

# React2Shell CVE-2025-55182 Campaign (2025)

This campaign addresses the **React2Shell** vulnerability (CVE-2025-55182) affecting React Server Components. The flaw allows a remote unauthenticated attacker to execute arbitrary code by crafting malicious HTTP requests that abuse the `next-action` and `rsc-action-id` headers. Attackers have exploited the bug to deploy **crypto-miners**, **Cobalt Strike** beacons, **Sliver** payloads and the **Secret-Hunter** toolkit.

## Queries in this campaign

- **[react2shell_node_execution_detection.kql](react2shell_node_execution_detection.kql)** - Identifies suspicious Node/Bun processes executing commands associated with React2Shell payloads.
- **[react2shell_http_header_exploitation.kql](react2shell_http_header_exploitation.kql)** - Looks for HTTP requests with the `next-action` or `rsc-action-id` headers indicative of the exploit.
- **[react2shell_c2_and_metadata_detection.kql](react2shell_c2_and_metadata_detection.kql)** - Flags outbound connections to known threat infrastructure and metadata endpoints.
- **[react2shell_temp_file_creation.kql](react2shell_temp_file_creation.kql)** - Detects suspicious file writes in temporary directories involving known payloads.

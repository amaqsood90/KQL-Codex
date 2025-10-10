# SharePoint-2025 — CVE-2025-53770 Campaign

This folder collects detection artifacts and guidance related to active exploitation of SharePoint servers (CVE-2025-53770 / CVE-2025-53771).

## Queries
- [ToolPane.aspx exploit activity](../../Hunting-Queries-Detection-Rules/Network-Logs/sharepoint_cve_2025_53770_toolpane_exploit.kql) — detects requests to `/_layouts/15/ToolPane.aspx` with `DisplayMode=Edit` and known exploit parameters (Unit42 IOCs).
- (Guidance) If you have IIS logs forwarded to Sentinel, map `RequestURL` and `RemoteIP` to CommonSecurityLog for this query to work.

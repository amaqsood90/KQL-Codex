# SharePoint-2025 – CVE-2025-53770 Campaign (ToolShell)

This folder collects detection artifacts and guidance related to active exploitation of SharePoint servers (CVE-2025-53770 / CVE-2025-53771), dubbed "ToolShell" by the security community. Threat groups including Linen Typhoon (APT27) and Violet Typhoon (APT31) were among the first observed exploiting these vulnerabilities against government and healthcare targets.

## Queries

- [ToolPane.aspx exploit activity](../../Network-Logs/sharepoint_cve_2025_53770_toolpane_exploit.kql) - Detects requests to `/_layouts/15/ToolPane.aspx` with `DisplayMode=Edit` and known exploit parameters.

## Notes

If you have IIS logs forwarded to Sentinel, map `RequestURL` and `RemoteIP` to CommonSecurityLog for this query to work.

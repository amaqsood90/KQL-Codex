# Shai Hulud (npm) – 2025 Campaign

**Scope:** npm supply-chain postinstall abuse, secret scanning, GitHub egress and organization abuse.

## Queries

- **MDE:** [npm → postinstall chain](../../Defender-For-Endpoint/npm_shaihulud_process_tree.kql)
- **MDE:** [Secret scanners invoked](../../Defender-For-Endpoint/npm_secret_scanners_invoked.kql)
- **MDE:** [GitHub egress after npm install](../../Defender-For-Endpoint/npm_to_github_egress_windowed.kql)
- **MDE:** [Suspicious git/gh activity](../../Defender-For-Endpoint/suspicious_git_gh_activity_from_build_hosts.kql)
- **MDE:** [Artifact creation from hooks](../../Defender-For-Endpoint/npm_hook_artifact_creation.kql)
- **MDE:** [macOS persistence via LaunchAgents/Daemons](../../Defender-For-Endpoint/macos_launchagents_daemons_persistence.kql)
- **MDE:** [Linux persistence via systemd/cron](../../Defender-For-Endpoint/linux_systemd_cron_persistence.kql)
- **MDE:** [Malicious artifacts & IOC hash touch](../../Defender-For-Endpoint/malicious_artifacts_and_hash_touch.kql)
- **MDE:** [Artifact → Exfil correlation](../../Defender-For-Endpoint/artifact_to_exfil_correlation.kql)
- **GitHub:** [Audit worm behaviors](../../Cloud-Activity/GitHub/github_audit_worm_behaviors.kql)
- **Watchlist:** [Compromised npm packages](../../ThreatIntel-Integrations/watchlist_compromised_npm_packages.kql)

## Watchlist

Create a watchlist named `ShaiHuludNPMPackages` with a `PackageName` column containing lower-case package names from your threat intel feed.

## Tuning

- Allowlist known build agents and sanctioned scripts to reduce noise.
- Adjust `installWindow` and lookback periods to suit your environment.
- Exclude repositories marked internal-sandbox.

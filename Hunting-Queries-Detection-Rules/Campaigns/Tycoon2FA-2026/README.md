# Tycoon2FA-2026 — AiTM Phishing-as-a-Service Campaign

Storm-1747 operated Tycoon2FA, a PhaaS platform enabling adversary-in-the-middle attacks at scale — reaching 500,000+ organizations per month by intercepting session cookies to bypass MFA. Disrupted March 4, 2026 by Microsoft DCU in collaboration with Europol.

**Kill chain:** Phishing email (.svg/.pdf/.html/.docx + QR codes) → redirect chain (Azure Blob, Firebase, Wix, TikTok) → custom CAPTCHA gate → spoofed M365/Gmail sign-in via AiTM proxy → credential and session cookie capture → Telegram exfil → post-compromise persistence (inbox rules, new MFA device registration, follow-on phishing)

## Queries

- **Entra ID:** [tycoon2fa_aitm_risky_signin.kql](../../Defender-For-Office365/tycoon2fa_aitm_risky_signin.kql) — Risky browser sign-in from unmanaged non-compliant device `T1557` `T1078`
- **MDO + Entra ID:** [tycoon2fa_url_click_then_risky_signin.kql](../../Defender-For-Office365/tycoon2fa_url_click_then_risky_signin.kql) — URL click followed by risky sign-in within 1 hour `T1566.002` `T1557`
- **MDO:** [tycoon2fa_post_compromise_inbox_rule.kql](../../Defender-For-Office365/tycoon2fa_post_compromise_inbox_rule.kql) — Inbox rule created within 2 hours of risky sign-in `T1137.005` `T1557`
- **Entra ID:** [tycoon2fa_new_mfa_device_after_signin.kql](../../Defender-For-Office365/tycoon2fa_new_mfa_device_after_signin.kql) — New MFA device registered within 1 hour of risky sign-in `T1098.005` `T1557`

## References

- [Inside Tycoon2FA: How a leading AiTM phishing kit operated at scale](https://www.microsoft.com/en-us/security/blog/2026/03/04/inside-tycoon2fa-how-a-leading-aitm-phishing-kit-operated-at-scale/) — Microsoft Threat Intelligence, March 4, 2026

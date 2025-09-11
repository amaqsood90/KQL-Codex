# 📘 KQL-Codex

**An evolving collection of threat hunting and detection logic for defenders working with the Microsoft security stack.**

---

## 🧭 About the Codex

KQL-Codex is a living library of Kusto Query Language (KQL) scripts designed to support:

- 🛡️ **SOC operations**
- 🎯 **Proactive threat hunting**
- 🔎 **Incident investigation**
- 📊 **Log telemetry analysis**

Built for Microsoft Sentinel, Defender for Endpoint, Defender for Identity, Azure AD, and beyond.

Whether you're a Tier 1 analyst or an advanced threat hunter, this codex gives you a head start on asking the right questions—and getting the right answers—using the power of KQL.

---

## 📁 Repository Structure

```bash
KQL-Codex/
│
├── AzureAD/                # Azure Active Directory queries (sign-ins, conditional access, etc.)
├── DefenderEndpoint/       # MDE queries for device-based telemetry
├── DefenderIdentity/       # Identity-based detections (Kerberos, NTLM, etc.)
├── Sentinel/               # Scheduled analytics rules and custom hunting queries
├── ThreatHunting/          # General-purpose hunting queries
├── MITRE/                  # Queries mapped to MITRE ATT&CK tactics & techniques
└── Utils/                  # Query helpers, enrichment logic, etc.

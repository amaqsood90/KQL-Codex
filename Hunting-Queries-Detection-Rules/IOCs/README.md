# IOCs

Version-controlled indicator lists, one CSV per campaign, consumed by KQL at run time. Keeping indicators out of query bodies means a rule is written once and stays current: edit the CSV on `main`, and every deployed copy of every rule that reads it picks up the change on its next run.

## Layout

```
IOCs/
├── README.md
└── <Campaign-YYYY>/                 ← mirrors Campaigns/<Campaign-YYYY>/
    └── <campaign>_<yyyy>_iocs.csv
```

The folder name matches the campaign pack so the two pair up. Queries that consume a CSV live in the data-source folder their table belongs to (`Network-Logs/`, `Defender-For-Endpoint/`, …), prefixed `<campaign>_ioc_`, and are linked from the campaign README alongside the behavioural queries.

## Schema

Every CSV uses the same five columns so one `externaldata` signature works everywhere:

```
Indicator,Type,Context,Source,DateAdded
```

| Column | Meaning |
|---|---|
| `Indicator` | The value to match, **fanged** (real form — `log.gitclone.org`, not `log.gitclone[.]org`). A machine reads this; defanging is for human-facing reports. |
| `Type` | One of `ip` · `domain` · `url` · `sha1` · `sha256` · `md5` · `filepath` · `account` |
| `Context` | What the indicator is — enough for an analyst to triage a hit without opening the source |
| `Source` | Who published it |
| `DateAdded` | `YYYY-MM-DD` the row was added here — use it to age out infrastructure indicators |

**Rules**

- **Atomic indicators only.** Regex patterns (generated account names, URL shapes) and API paths that legitimate traffic also hits belong in query logic, not here. `matches regex` needs a constant pattern, and a CSV row that fires on normal admin activity makes the whole list untrustworthy.
- **Hashes lowercase.** Queries compare against `tolower()` of the telemetry column.
- **No commas inside values.** The schema is plain CSV with no quoting.
- **Every row must be something that should never legitimately appear.** If it needs a tuning note, it is a behavioural detection, not an IOC.

## Consuming a CSV

### `externaldata` (default)

Reads the file straight from `main` at query time. This is the pattern every `_ioc_` query in the repository uses.

```kql
let IOCs = materialize(externaldata(Indicator:string, Type:string, Context:string, Source:string, DateAdded:string)
    [@"https://raw.githubusercontent.com/amaqsood90/KQL-Codex/main/Hunting-Queries-Detection-Rules/IOCs/Artifactory-2026/artifactory_2026_iocs.csv"]
    with (format="csv", ignoreFirstRecord=true));
let IPIndicators = IOCs | where Type == "ip" | project Indicator, Context;
DeviceNetworkEvents
| where Timestamp > ago(30d)
| join kind=inner (IPIndicators) on $left.RemoteIP == $right.Indicator
```

`materialize()` fetches the file once per query rather than once per reference. Filter on `Type` before joining so an IP list never gets compared against a hash column.

**Works in:** Microsoft Sentinel / Azure Monitor Log Analytics, Azure Data Explorer.
**Does not work in:** the Microsoft Defender XDR advanced hunting portal — `externaldata` is not supported there. Queries that use it carry `Product: Sentinel` in their header even when they read MDE tables, because that is where they run.

A query written this way only works once the CSV is live on `main`. To test an unpushed CSV, point the URL at the branch (`.../KQL-Codex/<branch>/...`) or paste the rows into a `datatable` temporarily.

### Sentinel Watchlist (alternative)

Upload the CSV in **Microsoft Sentinel → Watchlists** with `Indicator` as the search key, then swap the `externaldata` block for:

```kql
let IOCs = _GetWatchlist('Artifactory2026_IOCs')
    | project Indicator = SearchKey, Type, Context, Source, DateAdded;
```

Use this when the workspace cannot reach `raw.githubusercontent.com`, or when you want the indicator set frozen for change control rather than tracking `main`. The trade-off is that updates are a manual re-upload per workspace. The existing [watchlist_compromised_npm_packages.kql](../ThreatIntel-Integrations/watchlist_compromised_npm_packages.kql) shows the pattern.

### Defender XDR custom indicators (XDR-only estates)

For tenants without Sentinel, import the `ip`, `domain`, `url`, and hash rows into **Defender → Settings → Endpoints → Indicators**. Defender then blocks or alerts natively, no KQL needed. Account and file-path rows have no equivalent there and would need an inline `datatable` in a custom detection rule.

## Adding a campaign

1. Create `IOCs/<Campaign-YYYY>/<campaign>_<yyyy>_iocs.csv` with the schema above.
2. Write `<campaign>_ioc_*.kql` queries in the matching data-source folders, each with the `externaldata` block pointing at the new CSV.
3. Link the CSV and the IOC queries from `Campaigns/<Campaign-YYYY>/README.md` under an **IOC Queries** heading.
4. Update the data-source folder READMEs and the root README structure tree.

## Campaigns

| Campaign | CSV | Rows | Types |
|---|---|---|---|
| [Artifactory-2026](../Campaigns/Artifactory-2026/) | [artifactory_2026_iocs.csv](Artifactory-2026/artifactory_2026_iocs.csv) | 34 | ip · domain · url · sha1 · filepath · account |

# Timestamps

Status: proposed shell helpers for DUNE job scripts. This page does not record a DUNE-wide adoption decision.

## Timestamp formats

Job scripts in HEP experiments frequently embed timestamps, in log lines, output filenames, and directory tags. Without a shared convention, ad-hoc formats accumulate: colons in filenames, local-time stamps mislabelled as UTC, and inconsistent separators.

There are two distinct use cases, each needing a different format:

| Use case | Format string | Example output | Why |
|---|---|---|---|
| Log lines, human-readable | `%Y-%m-%dT%H:%M:%SZ` | `2026-06-05T14:03:22Z` | Canonical ISO 8601; colons are fine in flowing text |
| Filenames, path tokens | `%Y%m%dT%H%M%SZ` | `20260605T140322Z` | Colon-free, lexicographically sortable, safe on all filesystems including Windows NTFS |

A common mistake is `%Y-%m-%dT_%H%M%SZ`, with a literal underscore after the `T`. That is not ISO 8601. The canonical separator between date and time is just `T`, with no extra character.

## Always use `-u` (UTC / Zulu)

The `Z` suffix in both formats is a claim that the timestamp is UTC. Use `date -u` to make the result independent of the host timezone:

```bash
date -u +%Y-%m-%dT%H:%M:%SZ    # correct, UTC
date    +%Y-%m-%dT%H:%M:%SZ    # wrong, local time labelled as UTC
```

Without `-u`, these commands use the host timezone, which may differ from UTC.

## Proposed shared helpers

```bash
# Canonical UTC timestamp for log lines (ISO 8601 with colons)
iso_now()      { date -u +%Y-%m-%dT%H:%M:%SZ; }

# Colon-free UTC timestamp safe for filenames and directory tags
iso_now_file() { date -u +%Y%m%dT%H%M%SZ; }
```

```bash
log() { echo "[$(iso_now)] $*"; }
outdir="run_$(iso_now_file)"
```

## Adoption requirements

Agree where DUNE job scripts should obtain these helpers and which maintained scripts should use them. A shared worker-setup script for justIN jobs is one candidate; the implementation and owner remain to be agreed.

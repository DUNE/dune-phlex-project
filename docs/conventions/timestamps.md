# Timestamps

Status: correct usage already exists in parts of EMPHATIC's grid stack, but there is no single source of truth even there, and the convention has not been adopted DUNE-wide.

## Why this matters

Job scripts in HEP experiments frequently embed timestamps, in log lines, output filenames, and directory tags. Without a shared convention, ad-hoc formats accumulate: colons in filenames, local-time stamps mislabelled as UTC, and inconsistent separators.

## The two format strings

There are two distinct use cases, each needing a different format:

| Use case | Format string | Example output | Why |
|---|---|---|---|
| Log lines, human-readable | `%Y-%m-%dT%H:%M:%SZ` | `2026-06-05T14:03:22Z` | Canonical ISO 8601; colons are fine in flowing text |
| Filenames, path tokens | `%Y%m%dT%H%M%SZ` | `20260605T140322Z` | Colon-free, lexicographically sortable, safe on all filesystems including Windows NTFS |

A common mistake is `%Y-%m-%dT_%H%M%SZ`, with a literal underscore after the `T`. That is not ISO 8601. The canonical separator between date and time is just `T`, with no extra character.

## Always use `-u` (UTC / Zulu)

The `Z` suffix in both formats is a claim that the timestamp is UTC. That claim is only true if `-u` is passed to `date`:

```bash
date -u +%Y-%m-%dT%H:%M:%SZ    # correct, UTC
date    +%Y-%m-%dT%H:%M:%SZ    # wrong, local time labelled as UTC
```

Without `-u`, the `Z` suffix is false.

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

## Current state in EMPHATIC

The EMPHATIC grid stack (`emphprod/emphgridutils/bin/`) already uses the correct log format in two places: `worker_setup.sh.template` and `gridSubFunctions.sh`. Both contain identical `log()` functions, meaning there is no single source of truth. The format itself is correct, but the duplication means a future change would need to be made in two places.

One script diverges from the convention: `emphproduction/scripts/run_screen.sh` uses `date +"%Y%m%d_%H%M%S"`, local time, no `-u`, no `Z`, for a log filename. It should be replaced with `iso_now_file` once the helper is factored into a shared source.

NOvA's production scripts under `NovaGridUtils/` use a wide variety of formats, including local-time-with-timezone-abbreviation, dash-separated, dot-separated, and one format with a likely day/month swap bug plus epoch seconds appended. Bare `date` with no format string also appears in places, which is locale-dependent.

## Proposed path to wider adoption

1. Factor `iso_now` and `iso_now_file` into `emphprod/emphgridutils/bin/gridSubFunctions.sh`, fixing the duplication.
2. Adopt `iso_now_file` in `run_screen.sh` as the first use.
3. Pitch the same helpers to DUNE and NOvA production, for example through a short PR or computing note.

For DUNE specifically, the natural fit is a shared worker-setup script for justIN-based jobs, particularly for output directory naming under justIN and Rucio-managed storage. No such script exists yet.

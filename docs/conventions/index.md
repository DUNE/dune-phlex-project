# Conventions

Phlex itself does not mandate units, timestamp formats, or Python usage patterns. These are DUNE-specific conventions being proposed on top of Phlex for DUNE-facing code. None of the three below has been formally ratified as of 2026-08-26. Each page states its own status explicitly.

- [Units (CLHEP)](units.md): a proposal that DUNE adopt the CLHEP system of units, implemented with Brett Viren's `hep-units` and `hep-config` packages. Going to the Phlex Adoption WG in September 2026, not yet adopted.
- [Timestamps](timestamps.md): a proposed pair of shell helpers for UTC, ISO 8601 timestamps in job scripts. Already correctly used in parts of EMPHATIC's grid stack, not yet adopted DUNE-wide.
- [Python](python.md): a proposed Phlex Adoption WG sub-session to establish Python-Phlex data-product and library conventions, triggered by open design questions from the Phlex dev team. Not yet scheduled, no conventions exist yet.

If you're looking for an existing, ratified convention, none of these three qualify yet. Treat this section as a record of what's being proposed and why, not a settled reference.

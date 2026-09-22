---
title: Home
---

# DUNE Phlex Project

Documentation, workflow reference, and conventions for DUNE-facing work on [Phlex](https://github.com/Framework-R-D/phlex), the framework DUNE is migrating to from `art`. This site exists because the Phlex-related code repos across the DUNE and Framework-R-D GitHub orgs are code only: no shared narrative documentation, no training material, no single place that lays out how the six DUNE detector subsystems' workflows relate to each other under Phlex. It follows the same pattern as [`dune-spack-project`](https://dune.github.io/dune-spack-project/), which does the equivalent job for Spack and MPD.

## Quick links

- [Subsystem workflows](subsystems/index.md): what each of the six DUNE detector subsystems' pre-Phlex production chain looks like today, and what each subsystem's own workflow deck has raised as a Phlex-relevant pain point.
- [Hierarchy model](hierarchy-model.md): a synthesis of what a Phlex-era data hierarchy could look like, built from what the six subsystem decks independently proposed.
- [Conventions](conventions/index.md): DUNE-specific conventions being proposed for Phlex-era code (units, timestamps, Python), each marked with its actual adoption status.
- [Ecosystem: dune-xerosere](ecosystem.md): Brett Viren's pathfinder umbrella environment for growing a DUNE ecosystem around Phlex.
- [Migration status](migration-status.md): the milestone ladder and a snapshot of migration scope.
- [Repositories](repositories.md): the DUNE-org and Framework-R-D-org repos relevant to Phlex.

## Who this is for

- **New to Phlex and DUNE's migration to it**: start with [Subsystem workflows](subsystems/index.md), then [Migration status](migration-status.md).
- **Deciding how to structure data for your subsystem**: read [Hierarchy model](hierarchy-model.md) alongside your own subsystem's page.
- **Writing Phlex-era code and wondering what conventions to follow**: [Conventions](conventions/index.md), and note that most of what's there is proposed, not yet ratified.
- **Looking for where the actual code lives**: [Repositories](repositories.md).

## Status

This site is a local build as of 2026-08-26, not yet published. It was seeded from five newly-ingested Phlex Adoption WG subsystem-workflow decks plus existing DUNE Phlex reference material. Content will need review from subsystem owners and the Phlex Adoption WG before anything here is treated as authoritative guidance rather than a working synthesis.

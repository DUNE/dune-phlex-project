---
title: Home
---

# DUNE Phlex Project

Documentation and working synthesis for DUNE-facing work on [Phlex](https://github.com/Framework-R-D/phlex), the framework DUNE is migrating to from `art`. The site is currently strongest as a sim/reco workflow reference: it brings six Phlex Adoption Working Group presentation scopes together, documents their differences, and connects them to framework, I/O, migration, and convention questions. It does not yet cover every DUNE software area; see [Coverage and known gaps](coverage.md).

## Quick links

- [*Migrating to Phlex*](https://framework-r-d.github.io/phlex-examples/): the Phlex developers' guide to moving an `art` module to Phlex (separation, extraction, binding), with LArSoft's `GausHitFinder` as the worked example. Start here if you are migrating code.
- [Workflow reference](subsystems/index.md): what the six documented workflow presentations say about current production chains and Phlex-relevant needs.
- [Hierarchy model](hierarchy-model.md): candidate topology patterns and evidence-qualified mappings, not one universal tree.
- [I/O, persistence, and associations](io-persistence.md): the separation between Window scheduling, cross-layer access, and persistent relationships through FORM.
- [Existing art/FHiCL workflows](existing-art-workflows.md): literal configurations and modules available as concrete migration and validation entry points.
- [Conventions](conventions/index.md): DUNE-specific conventions being proposed for Phlex-era code (units, timestamps, Python), each marked with its actual adoption status.
- [Ecosystem: dune-xerosere](ecosystem.md): Brett Viren's pathfinder umbrella environment for growing a DUNE ecosystem around Phlex.
- [Migration status](migration-status.md): the milestone ladder and a snapshot of migration scope.
- [Coverage and known gaps](coverage.md): what the site covers well and which DUNE software areas are still missing.
- [Repositories](repositories.md): the DUNE-org and Framework-R-D-org repos relevant to Phlex.

## Who this is for

- **New to Phlex and DUNE's migration to it**: start with [Workflow reference](subsystems/index.md), then [Migration status](migration-status.md).
- **Migrating an `art` module**: follow the Phlex developers' [*Migrating to Phlex*](https://framework-r-d.github.io/phlex-examples/) guide, and use [Existing art/FHiCL workflows](existing-art-workflows.md) to pick a concrete starting module.
- **Building Phlex or the DUNE software stack with Spack**: see the companion [DUNE Spack Project](https://dune.github.io/dune-spack-project/).
- **Deciding how to structure data for your subsystem**: read [Hierarchy model](hierarchy-model.md) alongside your own subsystem's page.
- **Writing Phlex-era code and wondering what conventions to follow**: [Conventions](conventions/index.md), and note that most of what's there is proposed, not yet ratified.
- **Looking for where the actual code lives**: [Repositories](repositories.md).

## Related

- [DUNE Spack Project](https://dune.github.io/dune-spack-project/): the companion site for Spack and MPD, which DUNE uses to build and develop Phlex-era software.
- [Phlex framework documentation](https://github.com/Framework-R-D/phlex): the framework itself.

## Status

Last verified: 2026-08-26. The site was seeded from Phlex Adoption WG workflow presentations plus existing DUNE Phlex reference material. Content needs review from workflow owners and the Phlex Adoption WG before it is treated as authoritative guidance rather than a working synthesis. Publication state is maintained in the repository README rather than embedded in the long-lived site content.

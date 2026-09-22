# Repositories

Last verified: 2026-08-26. Repository names and content state are time-sensitive and should be rechecked before publication updates.

The Phlex framework itself is developed under the `Framework-R-D` GitHub organization. DUNE-specific subsystem code lives under the `DUNE` organization. As of 2026-08-26, every DUNE-org repo below is code-only, with no narrative documentation of its own, which is exactly the gap this site exists to fill.

## The framework

| Repository | Description |
|---|---|
| [Framework-R-D/phlex](https://github.com/Framework-R-D/phlex) | The Phlex framework itself. |
| [Framework-R-D/phlex-design](https://github.com/Framework-R-D/phlex-design) | Framework-level design documents. |
| [Framework-R-D/phlex-coding-guidelines](https://github.com/Framework-R-D/phlex-coding-guidelines) | Coding guidelines for Phlex framework and plugin code. |
| [Framework-R-D/core-software-documents](https://github.com/Framework-R-D/core-software-documents) | Core software design documents underlying the framework. |
| [Framework-R-D/phlex-examples](https://github.com/Framework-R-D/phlex-examples) | Example Phlex applications and plugins, and the source of the [*Migrating to Phlex*](https://framework-r-d.github.io/phlex-examples/) guide (`migration/doc/`, worked example in `migration/gauss_hit_finder/`). |
| [Framework-R-D/phlex-spack-recipes](https://github.com/Framework-R-D/phlex-spack-recipes) | Spack build recipes for Phlex and its dependencies. For DUNE's Spack setup, see the [DUNE Spack Project](https://dune.github.io/dune-spack-project/). |

These repos cover the framework itself: how Phlex works and how to build it. They are not where DUNE-subsystem workflow content belongs, which is the role this repository (`dune-phlex-project`) and the DUNE-org subsystem repos below play instead.

## ND subsystem repos (DUNE org)

| Repository | Subsystem |
|---|---|
| [DUNE/dune-nd-lar](https://github.com/DUNE/dune-nd-lar) | ND-LAr simulation and reconstruction code. |
| [DUNE/dune-nd-sim](https://github.com/DUNE/dune-nd-sim) | ND simulation code. |
| [DUNE/dune-nd-reco](https://github.com/DUNE/dune-nd-reco) | ND reconstruction code. |
| [DUNE/dune-tms-phlex](https://github.com/DUNE/dune-tms-phlex) | TMS (Temporary Muon Spectrometer) Phlex code. |
| [DUNE/dune-sand](https://github.com/DUNE/dune-sand) | SAND simulation and reconstruction code. |

See [Workflow reference: ND sim/reco (ND-LAr+TMS)](subsystems/nd-lar-tms.md), [ND sim/reco (SAND)](subsystems/sand.md), and [ND prototypes](subsystems/nd-prototypes.md) for the workflows these repos are meant to eventually host.

## FD subsystem repos (DUNE org)

| Repository | Subsystem |
|---|---|
| [DUNE/dune-fd-hd](https://github.com/DUNE/dune-fd-hd) | FD Horizontal Drift TPC configuration and code. |
| [DUNE/dune-fd-vd](https://github.com/DUNE/dune-fd-vd) | FD Vertical Drift TPC configuration and code. |
| [DUNE/dune-fd-sim](https://github.com/DUNE/dune-fd-sim) | FD simulation code. |
| [DUNE/dune-fd-reco](https://github.com/DUNE/dune-fd-reco) | FD reconstruction code. |
| [DUNE/dune-fd-ana](https://github.com/DUNE/dune-fd-ana) | FD analysis code. |
| [DUNE/dune-pd-hd](https://github.com/DUNE/dune-pd-hd) | protoDUNE Horizontal Drift. |
| [DUNE/dune-pd-sp](https://github.com/DUNE/dune-pd-sp) | protoDUNE Single Phase. |
| [DUNE/dune-pd-vd](https://github.com/DUNE/dune-pd-vd) | protoDUNE Vertical Drift. |
| [DUNE/dune-op-det](https://github.com/DUNE/dune-op-det) | Optical/photon detection system (PDS) code, sim and reco. |
| [DUNE/dune-iceberg](https://github.com/DUNE/dune-iceberg) | ICEBERG test-stand code. |

See [Workflow reference: FD sim/reco (TPC)](subsystems/fd-tpc.md), [FD sim/reco (PDS)](subsystems/fd-pds.md), and [protoDUNE](subsystems/protodune.md).

## Shared and core repos (DUNE org)

| Repository | Purpose |
|---|---|
| [DUNE/dune-core](https://github.com/DUNE/dune-core) | Core DUNE-wide Phlex code shared across subsystems. |
| [DUNE/dune-obj](https://github.com/DUNE/dune-obj) | Shared data-product object definitions. |
| [DUNE/dune-calib](https://github.com/DUNE/dune-calib) | Calibration code shared across subsystems. |
| [DUNE/dune-geo-utils](https://github.com/DUNE/dune-geo-utils) | Geometry utility code. |
| [DUNE/dune-trigger](https://github.com/DUNE/dune-trigger) | Trigger-related code. |
| [DUNE/dune-utils](https://github.com/DUNE/dune-utils) | General DUNE-wide utility code. |
| [DUNE/dune-examples](https://github.com/DUNE/dune-examples) | Example DUNE Phlex applications. |

## Current state

As of the last verification date, essentially none of the DUNE-org workflow repositories above had substantive source code pushed. They existed primarily as Phlex-ready placeholders, with names and organization prepared ahead of migration work. The [milestones and migration scope](migration-status.md) page provides dated program checkpoints and inventory baselines; it does not claim to track live repository progress.

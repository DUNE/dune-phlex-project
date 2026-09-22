# Milestones and migration scope

This page separates three different things: the program milestone ladder, the last documented benchmark plan, and dated estimates of migration scope. It is not a live module-status dashboard.

Last verified: 2026-08-26.

## Milestone ladder

| Milestone | Target | Status |
|---|---|---|
| M1: Prototype | December 2025 | Done, reached December 22, 2025, on schedule. |
| M2: Integration | September 2026 | Nearest hard deadline. Integrated system capable of simple workflows, including I/O. |
| M3: Workflow | 2027 | Not yet reached. |
| M4: FD full feature | 2028 | Not yet reached. |
| M5: FD consolidation | 2029 | Not yet reached. |
| M6: ND full feature | 2030 | Not yet reached. |
| M7: ND consolidation | 2031 | Not yet reached. |

The M1 prototype passed an external CDF review in October 2025 with a strongly positive verdict: reviewers cited "clear advantages over existing frameworks," with risks judged "acceptable and mitigable." The prototype was tested on multiple platforms, has Python examples available, and its own documentation was described by reviewers as excellent.

## Last documented M2 benchmark plan

The June 2026 DPC preparation material recorded the following benchmark state. This is a dated checkpoint, not a claim that the table still represents August progress:

| Benchmark | June 2026 checkpoint |
|---|---|
| Multi-platform install and onboarding | Enabled against Phlex 0.1/0.2 |
| Python providers for basic product types | Enabled against Phlex 0.2 |
| Multi-layer data access | Enabled against Phlex 0.2 |
| C++23 build on target platforms | Enabled against Phlex 0.2 |
| FORM I/O round-trip | Planned for M2 |
| End-to-end simple FD workflow | Planned for M2 |
| First migrated algorithm in a Phlex workflow | Planned for M2 |
| Phlex environment in the `dunesw` release ecosystem | Planned for M2 |
| CI validation for Phlex-based repositories | Planned for M2 |

An owner-reviewed update is required before using this as the current M2 report.

## Migration scope baseline: 2026-04-09

The numbers below are a point-in-time snapshot from 2026-04-09, scanning the existing `art`/LArSoft plugin inventory across the DUNE org to estimate the scale of the migration. They describe the *starting* scope of the art-to-Phlex migration, not current progress against it, and they will be out of date by the time you read this. Treat them as an order-of-magnitude picture of what's being migrated away from, not a live dashboard.

**Direct declaration scope**: 433 direct plugin declarations across the scanned DUNE org repos.

**Blocker burden**: 282 of those declarations are blocked by at least one LArSoft `#include`, meaning they can't move independently of a LArSoft dependency being resolved first. 151 have no blocker found and could in principle move sooner.

**Indirect burden**: 794 further files are indirectly `art`-coupled downstream of the direct plugin inventory (config glue, support code, and possible `art`-shaped helpers that aren't standalone plugins themselves). The total scanned scope is 1,227 files, not 1,227 direct modules; most of that gap is this indirect tail.

![Functional taxonomy of the direct plugin inventory](images/dune-plugin-taxonomy.svg)

*The direct plugin inventory isn't one uniform blob. Core software and detector services (107) and reconstruction and signal processing (103) are the largest categories, with analysis and validation (91), simulation and detector response (72), and trigger, DAQ, and raw data (60) also substantial.*

![Org-level repository scope funnel](images/dune-repo-scope-scale.svg)

*How the full DUNE-org repository scope narrows down to the subset actually carrying `art` plugin declarations.*

By DUNE area, the direct declarations break down as: Far Detector and common physics (195), protoDUNE (83, currently in `duneprototypes`), Near Detector (82, mostly `garsoft` with a smaller `dunendlar` share), and core/common code (73).

## Execution tracking

There is no public module-by-module migration tracker yet. For current status on a specific module, repository, or M2 benchmark, ask the Phlex Adoption Working Group. A tracker link will be added here once a public view exists.

## See also

- [Repositories](repositories.md)
- [Subsystem workflows](subsystems/index.md)
- [Ecosystem: dune-xerosere](ecosystem.md)
- [Coverage and known gaps](coverage.md)

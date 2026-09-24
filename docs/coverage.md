# Coverage and known gaps

This site documents six sim/reco workflow presentations to the Phlex Adoption Working Group. The pages overlap in detector scope and do not cover all DUNE software.

Last verified: 2026-08-26.

## Current coverage

| Area | Coverage | Evidence |
|---|---|---|
| protoDUNE data hierarchy | Partial | DAQ terminology and offline object chain; no end-to-end production deck |
| ND prototypes | Partial | Four-slide hierarchy and workflow overview |
| ND-LAr and TMS sim/reco | Strong | Full production-chain deck |
| SAND sim/reco | Strong | Full workflow deck, framework status, and capacity concern |
| FD TPC sim/reco | Strong | Module/product chain, hierarchy proposal, and migration entry points |
| FD PDS sim/reco | Strong | Module/product chain, bottleneck, and migration recommendation |
| Existing FD art/FHiCL entry points | Partial | Literal configurations are documented for the FD TPC and PDS talks only |
| DUNE-native Phlex pathfinder packages | Partial | `dune-xerosere` package graph and reported status |
| Migration inventory | Dated baseline | April 2026 static audits, not current execution status |

## Material gaps

Core software and detector services, analysis and validation, and trigger/DAQ/raw-data code account for 258 of the 433 direct declarations in the April 2026 scope estimate. These areas have limited coverage here; the estimate also lacks a public, reproducible scan reference.

Pages or source-backed coverage are still needed for:

- conditions, calibration, geometry, channel maps, and framework services;
- DAQ ingress, trigger decisions, and `art::TriggerResults` replacement requirements;
- FORM, RNTuple, HDF5, schema evolution, and persistent references;
- analysis and CAF consumers;
- production orchestration, justIN, validation, and regression comparisons;
- core/common plugin migration and ownership;
- actual milestone progress, staffing, and current blockers.

The [I/O, persistence, and associations](io-persistence.md) page records design requirements. Supported configurations and executable validation results are still needed.

## Evidence and maintenance gaps

The following gaps remain after the September 2026 documentation review. This review did not reverify implementation status.

| Gap | Evidence needed |
|---|---|
| Source access | Public links and slide/page references for the six workflow presentations, the July pathfinder report, the FORM talk, and the CDR conclusions |
| Migration inventory | Public scan inputs, repository revisions, counting rules, and results supporting the April totals and figures |
| Current progress | An owner-reviewed F2 update, repository status, blockers, and a dated public tracker |
| Executable validation | A pinned software environment, sample inputs, commands, expected outputs, and comparison tolerances for the first migrated workflow |
| FHiCL discrepancy | A release-specific check of the conflicting Reco2 filenames in the FD TPC and PDS presentations |
| Convention decisions | Public proposals, review dates, and recorded adoption decisions for units, timestamps, and Python |
| Ownership | Confirmed maintainers and review contacts; presenting a workflow does not establish responsibility for its migration |

## How to interpret the six workflow pages

Treat each page as a documented **workflow scope**:

- `explicit`: stated directly in that scope's source deck;
- `inherited`: supplied by a companion presentation covering the same production chain;
- `inferred`: a cross-source interpretation that needs owner validation;
- `unaddressed`: the source does not provide evidence either way.

This evidence vocabulary is used in the [hierarchy comparison](hierarchy-model.md) to avoid turning missing discussion into apparent consensus.

# Coverage and known gaps

This site is currently strongest as a **sim/reco workflow reference**. Its six workflow pages correspond to presentations made to the Phlex Adoption Working Group; they are not six independent detector subsystems or a complete partition of DUNE software.

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

The April migration-scope scan shows that the site does not yet narrate much of the software it claims to serve. Core software and detector services, analysis and validation, and trigger/DAQ/raw-data code account for 258 of the 433 direct declarations in that dated scan.

Pages or source-backed coverage are still needed for:

- conditions, calibration, geometry, channel maps, and framework services;
- DAQ ingress, trigger decisions, and `art::TriggerResults` replacement requirements;
- FORM, RNTuple, HDF5, schema evolution, and persistent references;
- analysis and CAF consumers;
- production orchestration, justIN, validation, and regression comparisons;
- core/common plugin migration and ownership;
- actual milestone progress, staffing, and current blockers.

The first of these gaps to receive a dedicated page is [I/O, persistence, and associations](io-persistence.md), because it constrains both the hierarchy discussion and backward-compatible migration.

## How to interpret the six workflow pages

Treat each page as a documented **workflow scope**:

- `explicit`: stated directly in that scope's source deck;
- `inherited`: supplied by a companion presentation covering the same production chain;
- `inferred`: a cross-source interpretation that needs owner validation;
- `unaddressed`: the source does not provide evidence either way.

This evidence vocabulary is used in the [hierarchy comparison](hierarchy-model.md) to avoid turning missing discussion into apparent consensus.

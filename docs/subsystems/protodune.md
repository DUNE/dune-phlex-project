# protoDUNE

Owner: Jake Calcutt. Repos: `dune-pdhd`, `dune-pdsp`, `dune-pdvd` (HD, SP, VD readout variants), `dune-iceberg`, plus the pre-Phlex `protoduneana`, `p3s`, `protodune-metadex`, `protodune_beam`.

protoDUNE has no full step-by-step production-chain deck yet. Four of the other workflow scopes do; ND prototypes likewise has only a short hierarchy overview. What exists for protoDUNE is a data-hierarchy discussion (Calcutt, Phlex Adoption WG, 2026-06-15) that grounds DAQ terminology and documents the current offline object chain.

## DAQ and TDAQ terminology

Definitions pulled from the TDAQ System Design Doc, presented as the grounding for how "run" should be understood in the Phlex era:

- **DAQ partition**: the smallest unit of a detector and TDAQ that can be run independently, for example the readout of one APA.
- **DAQ run**: a period during which no full reconfiguration of a system is needed. A run subdivides into DAQ sub-runs marking periods of unchanged data-taking conditions. Multiple TDAQ runs can occur simultaneously when multiple DAQ sessions are active. This is distinct from a DUNE experiment or beam "run," which typically spans many TDAQ runs.
- **DAQ session**: a cohesive collection of TDAQ hardware and software working together to trigger and read out some portion of one detector module. A session is composed of several DAQ partitions; a partition can only be active in one session at a time.

A physical bank of APAs split into independent sessions (Session 1 covering APAs 1-5, Session 2 covering APAs 6-10, for example) produces two independent run and subrun sequences over the same physical detector, not one shared sequence.

## Questions answered for the Phlex hierarchy design

Four questions posed in advance, answered directly:

1. **What defines a run in protoDUNE?** A period during which the DAQ was configured to build Trigger Records from a set of trigger conditions. Trigger Record structure differs per subsystem: TPC uses one time window relative to the high-level trigger, PDS uses its own separate window.
2. **Is there a use for a sub-run structure?** Offline never used one for protoDUNE, but DAQ's own sub-run definition (a unique data-taking-conditions state) suggests one probably applies.
3. **What granularity for calibration constants?** Sub-run level, not event-level. Nothing prevents going finer (a sub-sub-run) if needed, since the hierarchy is only specified to Phlex, not fixed by the framework.
4. **Do simulation and data need separate structures?** Yes. The highest simulation unit is a "Timespan" representing an interesting period of time, across which MC "Origins" (GENIE interactions, radiological decays) are distributed. A single simulated particle can create signal seen in multiple events, or even across different runs from different DAQ partitions.

## Current offline data hierarchy

Raw data, after decoding:

- TPC: `vector<RawDigit>`, one per channel per Trigger Record, each holding a channel number and ADC sequence.
- PDS: `vector<OpDetWaveform>`, one per channel per Trigger Record, holding channel number, timestamp, and ADC sequence.

Reco1, TPC: `Wire` (deconvolved signal regions of interest) to `Hit` (Gaussian blob of charge) to `Cluster` (hits in one 2D view) to `PFParticle` (clusters from two or three planes combined into 3D) to `SpacePoint` (2D hits projected into 3D) to `Slice` (region of hits from one parent-particle interaction) to `Track`/`Shower` to `Calorimetry` (dQ/dX per plane, per track or shower).

Reco1, PDS: `OpWaveform` (deconvolved) to `OpHit` (localized signal) to `OpFlash` (group of OpHits).

## The Brett Viren principle

Relayed directly: different algorithms require different hierarchy layers, so algorithms need to be defined first to determine the hierarchy. Higher-order functions (fold and unfold) work through those layers, and algorithms connect at the edges through them. Designing a data hierarchy requires an end-to-end view of the processing chain, not a hierarchy chosen up front and imposed on the algorithms.

## Open gap

protoDUNE still needs a full production-chain deck, comparable to the four full workflow presentations for ND-LAr/TMS, SAND, FD TPC, and FD PDS. The existing deck covers DAQ vocabulary and the offline object chain, but not a step-by-step walkthrough of the current sim/reco pipeline.

Source: Calcutt, Phlex Adoption WG, 2026-06-15.

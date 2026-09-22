# Existing art/FHiCL workflows (today)

The subsystem pages describe what each chain does. This page is narrower: the literal, runnable FHiCL files and producers as named in the source decks, for identifying concrete de-artify candidates rather than working from module names alone.

Only two of the six workflow presentations document complete, runnable art/FHiCL production chains. The remaining presentations either describe non-FHiCL workflows or do not provide enough FHiCL detail to reconstruct the chain, as listed at the bottom of this page.

## FD sim/reco: TPC (HD 10kt, long-baseline)

As given in Chappell's talk, for the HD 10kt long-baseline path:

| Stage | FHiCL | Producers |
|---|---|---|
| Generation | `prodgenie_common_dunefd.fcl` | `rns`, `generator` (GENIE via `GENIEGen`, tuned by `genie_dune.fcl`) |
| G4 | `standard_g4_dune10kt.fcl` | `largeant`, `IonAndScint` |
| Detsim | `standard_detsim_dune10kt.fcl` | `tpcrawdecoder` (Wire-Cell, config `wirecell_dune.fcl`) |
| Reco1 | `standard_reco1_dune10kt.fcl` | `gaushit`, `spsolve`, `hitfd` (HD only) |
| Reco2 | `standard_detsim_dune10kt.fcl` (as given on the deck; same FHiCL name as Detsim, later stage) | `pandora` (config `pandoramodules_dune.fcl` in `dunereco`) and downstream (`pandoraTrack/Shower/calo/pid`, `cvnmap/eva`, `emtrkmichelid`, `energyrec*`) |

HD and VD workspaces mostly run the same producers with only configuration changes; the deck's own worked example is HD 10kt.

## FD sim/reco: PDS (photon detection side, same chain)

As given in Paulucci's talk, the PD-focused view of the same FD sim/reco chain:

| Stage | FHiCL | Modules |
|---|---|---|
| G4 | `standard_g4_dune10kt.fcl` | `largeant`, `IonAndScint`, `PDFastSim` (uses `LArPropertiesService`), `PhotonBackTracker` |
| Detsim | `standard_detsim_dune10kt.fcl` | `tpcrawdecoder` (TPC side), `opdigi` (uses `OpDetResponseInterface`) |
| Reco1 | `standard_reco1_dune10kt.fcl` | `gaushit`, `spsolve`, `hitfd` (TPC side), `opdec`, `ophit` |
| Reco2 | `standard_reco2_dune10kt.fcl` | TPC modules, `opflash`, `opslicer`, `flashmatch` |

**Discrepancy between the two source decks, flagged rather than resolved:** Chappell's talk names `standard_detsim_dune10kt.fcl` for the Reco2 stage; Paulucci's talk names `standard_reco2_dune10kt.fcl` for the same stage. Both decks are primary sources from the same working group, dated 2026-08-10 and presenting companion views of the same chain. This should be checked against the actual `dunesw` FHiCL files before treating either name as authoritative for a migration task.

## What this makes concrete for a first de-artify task

Chappell's own prioritization proposal (see the [FD TPC page](subsystems/fd-tpc.md)) names a specific entry point: start at `gaushit` and work outward through `spsolve`, `hitfd`, `pandora`, `pandoracalo`, `pandorapid`, `energyrec*`, using pre-existing `art` files as input. This is the one candidate starting point in the source material that is both concrete (named FHiCL stage, named producers) and chosen to enable early comparison with LArSoft output.

Backward compatibility is a validation gate, not yet a demonstrated guarantee. The test must specify the Phlex/FORM version, input-file format, product dictionaries, provenance, and associations needed by the chosen modules. See [I/O, persistence, and associations](io-persistence.md).

The alternative path in the same deck, starting from `generator` and rebuilding the full chain, does not provide that early file-based comparison and was not the presenter's recommendation.

## Subsystems without a documented art/FHiCL chain

- **SAND**: explicitly stated on the source deck, "We do not use LArSoft at all." Built on `μfw` (repo slug `ufw`), a separate C++ micro-framework, JSON-configured, not FHiCL. See the [SAND page](subsystems/sand.md).
- **ND-LAr+TMS and ND prototypes**: driven by `install_[step].sh`/`run_[step].sh` shell scripts and environment variables across Docker containers and Python virtual environments (GENIE, edep-sim, larnd-sim, ndlar-flow, SPINE), not FHiCL. Pandora and `tms-reco` in this chain use SL7/UPS/cmake builds, but the deck does not name FHiCL files for them. See the [ND-LAr+TMS page](subsystems/nd-lar-tms.md).
- **protoDUNE**: the current source deck (Calcutt) establishes that protoDUNE's raw and Reco1 data already live inside art/LArSoft, but does not walk a step-by-step FHiCL chain the way the FD-TPC and FD-PDS decks do. This is the same gap already noted on the [protoDUNE page](subsystems/protodune.md): a full production-chain deck for protoDUNE does not exist yet in this documentation.

Source: Chappell, FD TPC talk, Phlex Adoption WG, 2026-08-10; Paulucci, FD PDS talk, Phlex Adoption WG, 2026-08-10.

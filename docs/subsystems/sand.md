# ND sim/reco: SAND

Owner: Valerio Pia, presenting on behalf of the SAND sim/reco and physics group.

## Workflow

SAND shares its upstream chain with ND-LAr+TMS: GENIE (neutrino interaction generation on multiple targets) to EDep-Sim (GEANT4 particle propagation) to Spill Builder (merges beam, rock, and cosmic edep-sim files into one full-spill-per-entry file). From spill building, the ND workflow branches three ways: NDLAr, TMS, and SANDRECO.

**SANDRECO** performs event simulation and reconstruction for the SAND detector. It does not use LArSoft at all. It is built on **ufw**, a minimal C++ application-engine framework with a plugin-algorithm model, deployed in a containerized environment (`sand-ci`), configured via JSON. Its output is an analysis-level ROOT file consistent with the DUNE CAF format, containing the SAND-specific portion of the full CAF.

### ufw

Built to replace the earlier near-monolithic `sandreco` code, which was hard to test and develop, and whose data structures fit poorly with CAF-filling and full-spill or truth matching. ufw's design goal moves complexity into the framework engine and data structures, away from the algorithm and configuration layer, so junior developers writing algorithms don't need to touch the framework's internals. Each ufw process implements a constructor (sets inputs and outputs), a `configure` method (reads JSON), and a `run` method.

Stated directly on the source deck: **modules run sequentially, with no possibility to iterate or have complex dependencies between modules.** This is the same batch-only constraint the rest of the ND and FD chains have, here surfacing one layer below the top-level production model, inside a framework that isn't `art` at all.

### Status (as of the 2026-08-24 talk)

Current workflow (v1.1) copies MC truth into both the MC and reco parts of the CAF, useful for bootstrapping integration and testing ufw and sandreco end to end. v1.2 moves toward each subdetector (Tracker, ECAL, GRAIN) running independently and feeding a combined CAF streamer. A further stage (v1.x), not yet implemented, adds a combined-analysis step.

GRAIN's own internal chain: optical simulation (full GEANT4 scintillation-light simulation, input edep-sim, output grain-hits) to detector response and time-slicing (simulates SiPM matrix response, slices the spill, output grain-digits and grain-images) to volumereco (GPU-accelerated iterative maximum-likelihood-expectation-maximization algorithm, output voxels).

## Data hierarchy

CAF level: `caf::StandardRecord` to `SRNDBranch` to `SRSAND` to `SRSANDInt` (one per interaction) to per-subdetector branches (`SRGRAIN`, `SRTracker`, `SRECAL`).

Production level, with SAND's own stated preference at each layer:

- **Run**: "we like this, we don't yet use it in our simulations."
- **Subrun**: "we don't need this, but we are ok with it."
- **Spill**: "we currently start from here."
- **Time slice**: "we use this and probably we'll like to have it."

The direct fast-reco path from Spill straight to CAF is the stated end goal and is not yet implemented; today's path runs through the full per-detector branch structure instead.

## Migration status

No migration plan has been discussed yet. One floated possibility: migrate a simplified, start-to-end version (v1.1) first, purely to learn Phlex and see how ufw's modules translate. The ND steps upstream of SAND (GENIE, edep-sim) need migrating eventually too, but SAND could proceed in parallel using edep-sim files already produced by the existing ND pipeline.

**Stated biggest concern: personpower, not technical design.** The team is already fully committed to algorithm and analysis implementation, and it is unclear how a Phlex migration fits onto that list. This is a different kind of blocker from the associations and hierarchy-design gaps other subsystems have raised, and needs a different kind of response: staffing and timeline, not framework design.

Source: Pia, Phlex Adoption WG, 2026-08-24.

# ND sim/reco: SAND

Presenter: Valerio Pia, presenting on behalf of the SAND sim/reco and physics group.

## Workflow

SAND shares its upstream chain with ND-LAr+TMS: GENIE (neutrino interaction generation on multiple targets) to EDep-Sim (GEANT4 particle propagation) to Spill Builder (merges beam, rock, and cosmic edep-sim files into one full-spill-per-entry file). From spill building, the ND workflow branches three ways: NDLAr, TMS, and SANDRECO.

**SANDRECO** performs event simulation and reconstruction for the SAND detector. It does not use LArSoft at all. It is built on **μfw** (repo slug `ufw`), a minimal C++ application-engine framework with a plugin-algorithm model, deployed in a containerized environment (`sand-ci`), configured via JSON. Its output is an analysis-level ROOT file consistent with the DUNE CAF format, containing the SAND-specific portion of the full CAF.

### μfw

Built to replace the earlier near-monolithic `sandreco` code, which was hard to test and develop, and whose data structures fit poorly with CAF-filling and full-spill or truth matching. μfw's design goal moves complexity into the framework engine and data structures, away from the algorithm and configuration layer, so junior developers writing algorithms don't need to touch the framework's internals. Each μfw process implements a constructor (sets inputs and outputs), a `configure` method (reads JSON), and a `run` method.

The source deck states that μfw modules run sequentially, without iteration or complex dependencies between modules. This is a constraint within μfw; it should be assessed separately from the batch sequencing of the full ND production chain.

Docs: [μfw wiki](https://baltig.infn.it/dune/ufw/-/wikis/home), [μfw indico talk](https://indico.fnal.gov/event/70441/). Deployment environment: [sand-ci](https://baltig.infn.it/dune/sand-ci). Not-yet-complete Doxygen reference: [sandreco-experimental](https://sandreco-experimental-182e2b.baltig-pages.infn.it/).

### Status (as of the 2026-08-24 talk)

Current workflow (v1.1) copies MC truth into both the MC and reco parts of the CAF, useful for bootstrapping integration and testing μfw and sandreco end to end. v1.2 moves toward each subdetector (Tracker, ECAL, GRAIN) running independently and feeding a combined CAF streamer. A further stage (v1.x), not yet implemented, adds a combined-analysis step.

Per-task credits given on the source deck (initials plus surname, not full first names): I/O streamers (N. Tosi; PNG/CAF-like formats: P. Forni, S. Lanzi, G. Sirri), geometry managers (N. Tosi, F. Battisti, M. Tenti), MC truth readers and GRAIN optical simulation (V. Pia), Tracker detector response (F. Battisti), ECAL detector response (M. Tenti), GRAIN detector response and energy-deposit reconstruction (V. Cicero), GRAIN spill slicer (F. Mei).

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

No migration plan has been discussed yet. One floated possibility: migrate a simplified, start-to-end version (v1.1) first, purely to learn Phlex and see how μfw's modules translate. The ND steps upstream of SAND (GENIE, edep-sim) need migrating eventually too, but SAND could proceed in parallel using edep-sim files already produced by the existing ND pipeline.

The presentation identifies staffing as the main migration concern: the team is already committed to algorithms and analysis. A migration plan needs an agreed allocation of effort and a schedule.

Source: Pia, Phlex Adoption WG, 2026-08-24.

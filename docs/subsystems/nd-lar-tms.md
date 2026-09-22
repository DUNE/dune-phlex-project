# ND sim/reco: ND-LAr+TMS

Owner: Charlotte Knight. The most detailed production-chain map of any subsystem documented here: 30 slides walking the full pre-Phlex ND production chain as it exists in the `ND_Production` repository.

## Workflow

GENIE (truth-level neutrino interactions) to edep-sim (GEANT4 particle propagation and energy deposition) to spill building (merges fiducial and anti-fiducial edep-sim outputs, introduces spill-structure timing) to two parallel branches:

- **tms-reco**: simulates and reconstructs the Temporary Muon Spectrometer response.
- **larnd-sim**: simulates NDLAr charge and light response (seven internal stages: quench, drift, induced current, electronics response, light production, light detector response, packet assembly), then **ndlar-flow** for calibration and low-level reconstruction.

Both branches feed reconstruction: **ml-reco (SPINE)**, a machine-learning-based reconstruction of NDLAr interactions, and **Pandora**, a classical and ML-hybrid reconstruction. **ND CAFmaker** collates GENIE and edep-sim truth, SPINE output, Pandora output, and tms-reco output, and builds the cross-detector associations, including TMS to NDLAr track matching.

Every step up to and including CAFmaker is a candidate for Phlex migration; which stages and in what order is explicitly undecided. The steps run to full completion (all files processed) before the next stage starts, a batch model, not a streaming one.

## Data hierarchy

Two hierarchies unfold independently in parallel from Run, Subrun, Spill, and only meet at the end:

- **NDLAr**: Spill to Modules to {Pixels, Photosensors} to hits, then fold T0s, charge depositions, tracks and showers, then fold Interaction.
- **TMS**: Spill to Plane to Bar to Hits, then fold Tracks.

A final transform, marked "unsure" on the source deck, stitches NDLAr tracks and interactions to TMS tracks. Today's workflow has no clean, framework-native way to associate across the two independently-unfolded hierarchies; it is glued together ad hoc inside CAFmaker.

## Why this matters for Phlex

Phlex's runtime-defined data-layer DAG can represent the NDLAr and TMS branches without forcing them into one fixed Run/Subrun/Event structure. A Window higher-order function may help an algorithm operate over adjacent data cells, but it is not a general replacement for persistent associations or arbitrary cross-layer relationships. The TMS-to-NDLAr match therefore tests two separate needs: scheduling the matching algorithm with the right inputs, and representing its output relationships persistently through FORM. See [Candidate hierarchy patterns](../hierarchy-model.md) and [I/O, persistence, and associations](../io-persistence.md).

## Open questions from the source deck

Two candidate migration starting points, floated without a firm recommendation: start with **ndlar-flow** (possibly a simple translation from `h5flow`, and a good test of Phlex's Python integration), or start from **GENIE** and work forward (earlier stages are less complex).

The deck also raises a recurring Adoption Working Group theme directly: "I struggle to see the larger vision. Is the idea that the whole ND Sim/Reco workflow should be merged into one Phlex workflow? What are the great advantages of using Phlex?" This is a documentation gap more than a technical blocker, and part of the motivation for this site.

Some undocumented in-development stages in the deck were reverse-engineered from the repositories rather than confirmed with the developers directly; treat those details as representative for migration discussion rather than authoritative.

## Reference links

- [`ND_Production`](https://github.com/DUNE/ND_Production)
- [`larnd-sim`](https://github.com/DUNE/larnd-sim.git), [paper (JINST 18 P04034)](https://iopscience.iop.org/article/10.1088/1748-0221/18/04/P04034)
- [`h5flow`](https://github.com/DUNE/h5flow)
- [`tutorial-DUNENDSim`](https://github.com/DUNE/tutorial-DUNENDSim)
- [2x2 tutorial](https://github.com/DUNE/2x2_sim/wiki/Tutorial-on-running-2x2_sim-Apr2024)
- [2x2 file data definitions](https://github.com/DUNE/2x2_sim/wiki/File-data-definitions)
- [`dk2nu` flux format](https://github.com/NuSoftHEP/dk2nu)
- [CAF `StandardRecord` Doxygen reference](https://dune.github.io/duneanaobj/classcaf_1_1StandardRecord.html)
- [Example edep-sim run macro](https://github.com/DUNE/ND_Production/blob/main/run-edep-sim/macros/dune-nd.mac)

Source: Knight, Phlex Adoption WG, 2026-08-24.

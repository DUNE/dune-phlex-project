# ND prototypes

Owner: Sindhu Kumaran. Covers the 2x2 Demonstrator, MINERvA-in-2x2, and ArgonCube LUT simulation, a distinct scope from the full ND-LAr+TMS and SAND workflows. Repos: `2x2_sim`, `2x2_cosmics`, `mx2-online`, `ArgonCubeLUTSim`, `ndlar_39Ar_reco` (radiological background studies), `SlowControls2x2`.

This is a 4-slide breakout deck, the shortest primary source in this documentation set. It documents the current data hierarchy and asks whether it extends to full ND, rather than walking a full production chain.

## Workflow

Beam flux and particle generation, GEANT4 energy deposition (GENIE, edep-sim), detector and energy response (larnd-sim), event-building and calibration (ndlar-flow), then reconstruction via two parallel paths (SPINE and Pandora), both feeding Common Analysis Format production (ND_CAFMaker). Real data enters the chain directly at the event-building and calibration stage, alongside the simulated chain.

## Data hierarchy

Three named stages, each split into a charge (Q) and light (L) branch:

- **raw data**: Q: run, subrun, spill, TPC, raw hit collection (pixel ID, time, charge tuples). L: run, subrun, trigger, waveform per channel.
- **reco1**: Q: run, subrun, spill, TPC, calibrated hit collection. L: run, subrun, spill, TPC, flashes.
- **reco2**: run, subrun, event, interaction, particle, recursively (particles can contain particles).

MC truth follows the same shape as reco2, except particles carry energy depositions ("track segments") that associate many-to-many with the raw hits and waveforms.

## Does this hierarchy extend to full ND?

Kumaran's own answer: in principle yes, the same hierarchy is already used for full ND reconstruction and simulation, not just the prototypes. The stated problem is that `ndlar-flow` repeats data products for reference datasets inefficiently. The deck raises, without resolving, whether Phlex could help by connecting data products to each other directly.

This names the same bottleneck as Charlotte Knight's ND-LAr+TMS deck independently, framed as an associations problem, matching the associations gap raised across the other subsystem decks in this documentation.

Source: Kumaran, Phlex WG, 2026-06-15.

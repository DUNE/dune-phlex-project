# Subsystem workflows

DUNE's Phlex migration spans six detector subsystems: protoDUNE, ND prototypes, ND sim/reco (ND-LAr+TMS), ND sim/reco (SAND), FD sim/reco (TPC), and FD sim/reco (PDS). Each has its own current pre-Phlex production chain, its own data hierarchy, and its own open questions about what a Phlex-native version would look like. This section documents each one from the primary source deck presented to the Phlex Adoption Working Group.

All six converge on roughly the same eventual hierarchy shape (Run, Subrun, then some form of readout window, then detector-element branches), but they start from different places. ND-LAr+TMS and SAND share an upstream chain (GENIE, edep-sim, spill building) before branching. FD-TPC and FD-PDS split the same long-baseline chain into charge and light halves. protoDUNE and ND prototypes are the two subsystems without a full step-by-step production-chain deck yet, only data-hierarchy discussions.

See [Hierarchy model](../hierarchy-model.md) for a proposed way to fit all six into one extensible structure, built from what these six decks actually say.

## Coverage

| Subsystem | Owner | Primary source | Status |
|---|---|---|---|
| [protoDUNE](protodune.md) | Jake Calcutt | Data Hierarchy Discussion, 2026-06-15 | Data-hierarchy discussion only, no full production-chain deck |
| [ND prototypes](nd-prototypes.md) | Sindhu Kumaran | ND Prototypes Data Hierarchy, 2026-06-15 | 4-slide breakout deck |
| [ND sim/reco: ND-LAr+TMS](nd-lar-tms.md) | Charlotte Knight | ND Sim/Reco Workflow, 2026-08-24 | Full 30-slide production-chain deck |
| [ND sim/reco: SAND](sand.md) | Valerio Pia | SAND Sim/Reco Workflow, 2026-08-24 | Full 20-slide deck |
| [FD sim/reco: TPC](fd-tpc.md) | Andy Chappell | FD TPC Workflow, 2026-08-10 | Full 17-slide deck |
| [FD sim/reco: PDS](fd-pds.md) | Laura Paulucci | FD Sim/Reco PDS Workflow, 2026-08-10 | Full 14-slide deck |

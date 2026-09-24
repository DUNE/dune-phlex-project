# Workflow reference

This section covers six workflow presentations made to the Phlex Adoption Working Group: protoDUNE, ND prototypes, ND sim/reco (ND-LAr+TMS), ND sim/reco (SAND), FD sim/reco (TPC), and FD sim/reco (PDS). These are useful documentation scopes, not six independent detector subsystems or a complete taxonomy of DUNE software.

The presentations expose recurring roles but do not establish one common hierarchy. ND-LAr+TMS and SAND share an upstream chain (GENIE, edep-sim, spill building) before branching. FD-TPC and FD-PDS are companion views of the same long-baseline chain. protoDUNE and ND prototypes are the two scopes without a full step-by-step production-chain deck, and protoDUNE explicitly introduces a separate simulation Timespan/Origins structure.

See [Candidate hierarchy patterns](../hierarchy-model.md) for evidence-qualified data, beam-spill, extended-readout, and simulation topologies.

## Coverage

| Workflow | Presenter | Primary source | Status |
|---|---|---|---|
| [protoDUNE](protodune.md) | Jake Calcutt | Data Hierarchy Discussion, 2026-06-15 | Data-hierarchy discussion only, no full production-chain deck |
| [ND prototypes](nd-prototypes.md) | Sindhu Kumaran | ND Prototypes Data Hierarchy, 2026-06-15 | 4-slide breakout deck |
| [ND sim/reco: ND-LAr+TMS](nd-lar-tms.md) | Charlotte Knight | ND Sim/Reco Workflow, 2026-08-24 | Full 30-slide production-chain deck |
| [ND sim/reco: SAND](sand.md) | Valerio Pia | SAND Sim/Reco Workflow, 2026-08-24 | Full 20-slide deck |
| [FD sim/reco: TPC](fd-tpc.md) | Andy Chappell | FD TPC Workflow, 2026-08-10 | Full 17-slide deck |
| [FD sim/reco: PDS](fd-pds.md) | Laura Paulucci | FD Sim/Reco PDS Workflow, 2026-08-10 | Full 14-slide deck |

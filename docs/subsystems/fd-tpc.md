# FD sim/reco: TPC

Presenter: Andy Chappell (Warwick). Explicitly scoped as the TPC half of the FD talk pairing; the PDS half is covered separately.

## Configurations and geometries

High-level split: horizontal drift (HD) versus vertical drift (VD), each further split by workspace (HD 1x2x2 for fast trigger studies, HD 1x2x6 as the current standard, HD 10kt as the full future geometry; VD 1x8x6 as the current long-baseline standard, VD 1x8x14 for low-energy studies, VD 10kt in preparation). HD and VD mostly run the same producers with only configuration changes.

## Workflow

Standard long-baseline chain, generation through reconstruction:

| Stage | Producers | Key products |
|---|---|---|
| Generation | `rns`, `generator` (GENIE, DUNE-tuned) | `MCTruth`, `MCFlux`, `GTruth`, `BeamGateInfo` |
| G4 | `largeant` (Geant4 transport), `IonAndScint` | `SimEnergyDeposit`, `MCParticle` |
| Detsim | `tpcrawdecoder` (Wire-Cell) | `RawDigit`, `SimChannel`, `Wire` |
| Reco1 | `gaushit`, `spsolve`, `hitfd` | `Hit`, `SpacePoint`, `PointCharge` |
| Reco2 | `pandora` and downstream (track, shower, calo, PID, CVN classification) | `PFParticle`, `Vertex`, `Cluster`, `Track`, `Shower`, `Slice`, `Calorimetry`, `EnergyRecoOutput`, `AngularRecoOutput` |

Workflow-specific additions layer on top of this base chain for solar, supernova, and atmospheric physics channels (filters, clustering variants, direction reconstruction). PDS-specific stages are out of scope here; see the [FD PDS page](fd-pds.md).

Associations enumerated across Reco1/Reco2 include Wire-to-Hit, SpacePoint-to-Hit, Shower-to-{Cluster, PFParticle, Hit, PCAxis, SpacePoint, Track}, Track-to-{Calorimetry, ParticleID, Hit}, PFParticle-to-{PCAxis, Track, Vertex, Cluster, SpacePoint, Slice}. A flagged weakness: `art::Assns` cannot relate objects of the same type to each other; the current workaround is integer indexing.

## Proposed data hierarchy for Phlex

Baseline: Run to Subrun to Spill to APA. Three extensions proposed for the temporal and algorithmic partitioning FD needs:

- **Frame**: a layer at the same level as Spill (possibly reusing Spill itself), providing a regular window.
- **SN Burst**: a layer just above Frame/Spill that tracks the first and last Frame of interest for a supernova event and chains Frames together to process as one event, since supernova boundaries are defined algorithmically rather than by fixed windows.
- **Slice**: a possible layer below Spill, for algorithmic spatial partitions within a spill. More acute for ND, but relevant here given sub-spill-level interactions.

Trigger handling is raised as an open question, possibly treated the same way as supernova bursts by searching through trigger records.

See [Candidate hierarchy patterns](../hierarchy-model.md) for how the proposal compares with the other workflow presentations.

## Open problems

- Biggest named pain point: the amount of boilerplate (`art::ValidHandle`, `FindManyP`, `art::Ptr`) needed to pull one object out of a producer, contrasted with a one- or two-line access pattern wanted from Phlex.
- No named Phlex equivalent yet for `art::TriggerResults`.
- `PointCharge` sits structurally parallel to `SpacePoint` (same length, order, module tag) without an actual `Assn` between them, relying entirely on producers and downstream code to stay in sync. Raised directly as a question of whether these should be separate objects at all.
- CAFs as a Phlex data layer are flagged but not discussed in this deck.
- Prioritization proposal: get one basic end-to-end HD 10kt long-baseline workflow working first, since most stages are shared across FD workspaces. Two candidate migration paths from that template: start at `gaushit` and work outward, conditional on Phlex/FORM reading the required existing `art` products and relationships, or start at `generator` and rebuild the full chain in Phlex. The first path enables early comparison to LArSoft once that compatibility gate is demonstrated.

Source: Chappell, Phlex Adoption WG, 2026-08-10.

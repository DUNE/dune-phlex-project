# FD sim/reco: PDS

Presenter: Laura Paulucci. Covers the photon detection side of the FD sim/reco chain, deliberately scoped to avoid repeating the TPC side covered in the [companion FD TPC talk](fd-tpc.md).

## Workflow

High-level stages: event generator (GENIE) to GEANT4 and photon simulation to detector simulation to Reco1 (low-level, hit reconstruction) to Reco2 (high-level, flash reconstruction). `dunesw` (DUNE's configs, geometry, some algorithms) depends on LArSoft (core object definitions, algorithms, external packages), which depends on `art` (event loop, I/O, ROOT interface). Of the 29 steps in DUNE's FD-VD long-baseline sim/reco chain, 19 are outsourced to LArSoft directly.

| Stage | Modules | Consumes | Produces |
|---|---|---|---|
| G4 | `largeant`, `IonAndScint`, `PDFastSim` | `SimEnergyDeposit` | `OpDetDivRec`, `SimPhotonsLite`/`SimPhotons` |
| Detsim | `opdigi` | `OpDetDivRec` | `OpDetWaveforms` |
| Reco1 | `opdec`, `ophit` | `OpDetWaveforms` | `OpWaveform`, `OpHits` |
| Reco2 | `opflash`, `opslicer`, `flashmatch` | `OpHits` | `OpFlashes` |

`opslicer` and `flashmatch` still need further development for DUNE FD specifically.

## Data volume

`OpDetDivRec` and `OpDetBacktrackerRecord` are heavyweight: event-level, per-channel, per-time-slice, per-track-ID objects. FD-HD has 6000 photon detectors, FD-VD 10kt has 672. Usually cut down with a `PreScaleFactor` since photon detection efficiency runs around 5%. `OpWaveform` is similarly heavy (output as float, not unsigned integer) and is usually discarded once hit-finding is done.

## The G4 bottleneck

Full photon simulation in GEANT4 is slow. Current mitigation is "fast simulation," using one of: a photon library (visibility per voxel, precise but slow and memory-heavy for large volumes), a semi-analytical model (curve-fitted visibility, cannot predict visibility from behind a photon detector), a hybrid of the two (current default), or a computable-graph ML approach (still needs bias and resolution improvements). GPU offload via Opticks or Celeritas is a future direction.

`PDFastSim` is named as the single most challenging piece of the PD chain to migrate. The recent `larg4` refactor has already changed how full photon simulation works in several places.

## Missing associations

Explicitly flagged on the source deck: associations between `OpDetWaveforms` and `OpHit`, and between `OpHit` and `OpFlash`, "should exist but it is not there." This is another concrete association requirement, specifically about lineage and navigation through the optical reconstruction chain. It is related to, but semantically different from, ND cross-detector matching and the FD-TPC co-indexing examples.

## Migration recommendation

Start with reco, if backward compatibility with existing files is guaranteed, since that lets validation run against existing files while harder work proceeds in parallel. If that isn't possible, start from scintillation photon propagation, since `PDFastSim` is the hardest part and the `larg4` refactor has already introduced multiple places where things can go wrong.

Source: Paulucci, Phlex Adoption WG, 2026-08-10.

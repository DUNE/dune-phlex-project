# I/O, persistence, and associations

Status: active design area, not a ratified DUNE data model. Last verified: 2026-08-26.

This page separates three concepts that are easy to conflate when translating `art` workflows into Phlex:

| Concept | Role | Current reading |
|---|---|---|
| Window higher-order function | Schedules an algorithm over adjacent data cells | Useful for boundary or neighboring-cell operations; not a general association system |
| Cross-layer access | Supplies products from different hierarchy levels to one algorithm | A transient execution pattern, not persistence semantics |
| References and associations | Represent identity and relationships between data products | A first-class data-product and FORM persistence requirement; still active design work |

## FORM's role

FORM is the I/O layer designed for Phlex. The CHEP 2026 source describes three layers:

1. **Interface**: type-erased communication with Phlex.
2. **Persistence**: flattening the runtime data-product hierarchy into a persistable representation.
3. **Storage**: mapping that representation to file backends.

The planned storage roles are RNTuple for standard reconstruction files, HDF5 for DAQ and ML workflows, and TTree for legacy or debugging use. Persistent references between data products are listed as a FORM milestone, alongside metadata and concurrent reading/writing.

This matters to migration sequencing. Reading an existing `art` file is not enough by itself to guarantee backward compatibility: the test must cover required product dictionaries, provenance, identity, associations, and the FORM/Phlex version used for the comparison.

## Association requirement classes in the workflow sources

The presentations expose a shared theme, but not four identical problems:

| Workflow scope | Requirement class | Example |
|---|---|---|
| ND prototypes | Reference representation and duplication | `ndlar-flow` repeats reference datasets |
| ND-LAr and TMS | Cross-detector matching | TMS tracks must be matched to NDLAr tracks/interactions at CAF production |
| FD TPC | Co-indexed and same-type relationships | `PointCharge` and `SpacePoint` rely on ordering rather than an explicit relationship; same-type `art::Assns` are also raised |
| FD PDS | Product lineage and navigation | Waveform to Hit to Flash relationships are expected but absent |

A framework solution must therefore be tested for one-to-one, one-to-many, many-to-many, same-type, metadata-bearing, reverse-lookup, missing-product, and persistence behavior. A single Window-based stitch would not cover that requirement set.

## Candidate persistent representation

Brett Viren's data-model follow-up gives one concrete representation worth testing: products and their relationships as explicit tables, for example `tracks`, `hits`, and `track_hit_assns(track_id, hit_id, metadata...)`. The attraction is consistent transient and persisted logical columns across Arrow and FORM/RNTuple. The open test is whether joins, reverse lookup, and multi-hop navigation remain ergonomic enough for reconstruction users.

This is a candidate, not an adopted design. The Framework-R-D design discussion is also exploring associations as first-class data products rather than hierarchy nodes.

## Validation questions

- Can the same logical association be traversed efficiently in memory and after persistence?
- What identity remains stable across processes, files, schema versions, and output thinning?
- Can metadata-bearing and same-type associations be represented without special cases?
- Which existing `art` products can be read for Phlex-vs-LArSoft regression tests, and what information is lost?
- How do RNTuple's restrictions on persistent pointers, polymorphism, custom streamers, and some user containers affect current DUNE products?

## Sources

- Andrew Olivier et al., *RNTuple Integration in the Flexible Object Read/write Model*, CHEP 2026, 2026-05-27.
- Brett Viren, *DUNE Data Model in the Phlex Era: Toward a lingua franca for our algorithms*, 2026-05-20.
- [Phlex design documentation](https://framework-r-d.github.io/phlex-design/).
- [Persistent references and associations design discussion](https://github.com/Framework-R-D/phlex-design/blob/main/persistent-references-and-associations.md).
- [Hierarchy model](hierarchy-model.md)
- [Existing art/FHiCL workflows](existing-art-workflows.md)

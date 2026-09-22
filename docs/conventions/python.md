# Python

Status: proposed working session, not an existing convention. No ratified DUNE-wide Python-Phlex convention exists yet. As of the proposal (2026-08-12), the session itself was not yet scheduled: not yet replied to in the originating thread, date and format (virtual vs. in-person) not yet confirmed.

## Why now

Callum Wilkinson floated this after talking with Wim and Beojan from the Phlex dev team, who raised two concrete design questions that would inform Phlex's data-model work:

1. Whether all Phlex data products can be required to behave like a numpy array of basic types.
2. Whether the collaboration knows in advance which Python libraries (Numba, PyTorch, and similar) need to be supported, so the dev team can pre-emptively write plugins that stop those libraries from consuming resources uncontrolled.

Their broader ask was for more concrete Python-Phlex use cases. There are currently relatively few Python-heavy packages in the sim/reco pipelines (larnd-sim, SPINE, NuGraph, possibly some of Wire-Cell), which is part of why the timing matters: agree conventions while the group of Python developers is still small, before the informal pattern that already exists for Python (unlike C++, where coding conventions are broadly followed) hardens into something harder to change later.

## Proposed governance framing

Structure this as a Phlex Adoption WG sub-session rather than a freestanding initiative, to avoid it becoming another parallel Phlex-adjacent thread. It would also be a first instance of a proposed rotating workflow-limitation-talk format for regular WG meetings: one Python-package author per slot (larnd-sim, SPINE, NuGraph, Wire-Cell) briefly presenting concrete use cases, with Wim and Beojan turning those into design constraints.

The proposed deliverable is a short written "DUNE Python data-product and library conventions" note, feeding directly into Phlex's ongoing data-model design work, not just meeting notes with no artifact.

This is a different layer from the separate columnar-analysis effort (CAFAna/MaCh3, parquet/awkward), which concerns analysis-level Python. This proposal is about framework-facing sim/reco data products and Phlex plugin authors.

## Status

Not yet replied to in the originating thread. Date and format (virtual vs. in-person) not yet confirmed. Until this session happens and produces a written deliverable, there is no DUNE-wide Python-Phlex convention to point to, only these two open design questions and the intent to answer them collaboratively.

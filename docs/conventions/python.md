# Python

Status: proposed working session. The August 2026 proposal does not establish a DUNE-wide Python-Phlex convention or a confirmed session date.

## Design questions

The proposed Phlex Adoption WG session would address two questions:

1. Can Phlex data products be required to behave like a NumPy array of basic types?
2. Which Python libraries, including Numba and PyTorch, need framework support to control their resource use?

Use cases from larnd-sim, SPINE, NuGraph, and Wire-Cell would help test these requirements against simulation and reconstruction workloads.

## Proposed working session

Python-package authors would present their data products, library dependencies, and resource requirements to the Phlex developers. The intended output is a written proposal for DUNE Python data-product and library conventions, with unresolved questions recorded for framework design work.

The scope is framework-facing sim/reco products and plugin authors. Analysis-level Python conventions for CAFAna, MaCh3, Parquet, and Awkward require separate discussion.

A public proposal link, session date, and record of any decisions are still needed.

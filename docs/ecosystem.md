---
title: "Ecosystem: dune-xerosere"
---

# Ecosystem: dune-xerosere

Status: pathfinder evidence, not a DUNE endorsement. Last verified against the project report and follow-ups from 2026-07-08 to 2026-07-13.

`dune-xerosere` is an umbrella development environment built by Brett Viren for DUNE software using Phlex. It connects Wire-Cell, edep-sim, DAQ input, configuration, and I/O through separately developed packages.

## Why it exists

Phlex is young, and on its own it lacks enough DUNE-specific algorithms, services, I/O support, and data-model support to be immediately useful for ordinary DUNE work. `dune-xerosere` tries to grow that ecosystem sequentially, package by package, rather than waiting for a single large integration effort.

## Project philosophy

- Explore broadly, but prioritize.
- Factor packages along dependency lines.
- Make many packages easy to add and manage.
- Use modern CMake and Spack layering.
- Solve DUNE-specific problems through general packages where possible.
- Avoid overlap and avoid systematic lock-in.
- Review and test LLM-assisted contributions.

## Umbrella layout

`dune-xerosere` supports multiple source packages, Spack environment views, builds, and installs, laid out as:

- `devel/<package>/` for packages under active development, managed with `mr`.
- `extern/envs/<env>/view/{bin,lib,include}` for dependency views.
- `builds/envs/<env>/<package>/` for build outputs.
- `installs/envs/<env>/{bin,lib,include}` for installed outputs.

Packages developed inside `dune-xerosere` are intended to remain independently usable, without the umbrella environment at runtime.

## Package scope in the July 2026 report

The report groups the packages into these areas:

- **DUNE configuration**: `dune_config`.
- **DUNE DAQ data ingress**: `dune_daq_codec`, `dune_daq_types`, `dune_daq_hdf`, `dune_daq_arrow_frame_hdf`.
- **Arrow and HDF5**: `arrow_hdf`, `phlex_arrow_hdf`, `phlex_arrow_common`, `wire_cell_arrow`.
- **Wire-Cell and Phlex integration**: `wire_cell_phlex`, `wire_cell_phlex_arrow`.
- **edep-sim/Geant4 and Phlex integration**: `edep_sim_phlex`, `hepmc_phlex`, `phlexed`.
- **Adjacent GPU optical simulation**: `edep-simphony-plugin`, Simphony/Opticks, OptiX, CUDA.

Major external or adjacent pieces include the Wire-Cell Toolkit, Phlex itself, EDepSim, Simphony, Geant4, ROOT, Arrow, HDF5, Jsonnet, Boost, Python, TBB, and Perfetto.

## Reported working components (July 2026)

The report describes DUNE-specific Phlex payloads for:

- Wire-Cell Toolkit simulation and signal processing.
- edep-sim Geant4 simulation.
- DUNE DAQ HDF5 input trigger records.

## Apache Arrow as a data-model trial

`dune-xerosere` is trialing Apache Arrow as a lingua-franca in-memory data model. The motivation is the usual producer/consumer complexity problem: without a shared representation, N producers and M consumers need pairwise converters. A shared representation lets them meet at one common format instead. Current work includes Arrow support for Wire-Cell Toolkit and edep-sim scintillation/ionization observables, plus a generic `arrow-hdf` file I/O package.

This is a trial, not a DUNE-wide decision. Whether Arrow becomes the recommended in-memory representation for DUNE Phlex work, or stays scoped to the producers and consumers that already use it, is still an open question for the Phlex Adoption Working Group.

The evaluation needs real producer and consumer counts: does a shared Arrow schema reduce conversion work enough to justify its complexity? Struct-like products and explicit converters remain alternatives.

## Configuration

Configuration is a second major theme in the project. `dune_config` uses Jsonnet to separate detector-specific configuration from job-specific configuration, on both the Phlex and Wire-Cell Toolkit sides. `phlexed` provides a Phlex-plus-Jsonnet command-line tool intended to encourage organized configuration authoring.

## Phlex issues surfaced by this work

The July report identifies Phlex issues encountered with DAQ data, Wire-Cell, Geant4/edep-sim, configuration, I/O, and package management:

- Phlex v0.2.0 had no supported way to create a provider without reaching into `phlex::internal` namespaces. v0.3.0 changed that API, with expected churn for anyone who had worked around it the same way.
- Phlex v0.3.0's sources helped, but had residual namespace issues and one missing header; reported fixed in v0.3.1.
- Phlex v0.3.0 was missing `find_dependency()` CMake calls, which forced downstream code to declare Phlex's own dependencies explicitly; reported fixed in v0.3.1.
- FORM in v0.2.0 had a lossy `to_string()` implementation for data-cell indices, which blocked clean HDF5 round-tripping. v0.3.0 fixed the lossiness but retrieving full index information is still awkward.

Features requested in the July report: `resource` support for Wire-Cell wires, non-wire geometry, and online/offline channel maps; `translator` auto-engagement of data converters, replacing today's explicit conversion nodes; and `preserver` support for writing objects outside the older output-module model.

## Open pathfinder work

The source report lists material work still needed before the package graph should be read as a complete DUNE workflow:

- add downstream Wire-Cell reconstruction, including 3D imaging, clustering, and pattern recognition;
- connect edep-sim output to Wire-Cell drift and detector-simulation input;
- add FORM-based HDF5 I/O rather than relying on explicit workflow nodes;
- establish how Arrow objects connect to FORM and ROOT backends;
- evaluate Arrow against ROOT dictionaries using real producer and consumer counts;
- decide whether DUNE needs a typed configuration subsystem, schema, or code generation;
- identify which packages are independently buildable, maintained, tested, and ready for contributors other than the original developer.

A useful adoption artifact would be a package test matrix recording owner, maturity, dependencies, independently reproduced build, supported workflow, and whether the package or design choice is endorsed.

## See also

- [Hierarchy model](hierarchy-model.md)
- [I/O, persistence, and associations](io-persistence.md)
- [Conventions](conventions/index.md)
- [Subsystem workflows](subsystems/index.md)

## Sources

- Brett Viren, `dune-xerosere` project report and follow-ups, 2026-07-08 to 2026-07-13.
- [Phlex repository](https://github.com/Framework-R-D/phlex).

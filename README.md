# dune-phlex-project

Documentation, workflow reference, and conventions for DUNE-facing Phlex work: subsystem workflow decks, a proposed data-hierarchy model, DUNE-specific conventions (units, timestamps, Python), the `dune-xerosere` pathfinder ecosystem, migration status, and the relevant DUNE/Framework-R-D repositories.

Site: [dune.github.io/dune-phlex-project](https://dune.github.io/dune-phlex-project/)

Migrating an `art` module? Start with the Phlex developers' guide, [*Migrating to Phlex*](https://framework-r-d.github.io/phlex-examples/).

Built with [Zensical](https://zensical.org), following the same pattern as [`dune-spack-project`](https://github.com/DUNE/dune-spack-project).

Companion site: [DUNE Spack Project](https://dune.github.io/dune-spack-project/) ([repo](https://github.com/DUNE/dune-spack-project)), for Spack and MPD.

## Local development

```bash
uv sync --locked
uv run --locked zensical serve
```

or with the Makefile:

```bash
make install
make serve
```

## Copyright and Licensing

Copyright (C) 2026, DUNE Collaboration. Licensed under the Apache License, Version 2.0.

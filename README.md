# dune-phlex-project

Documentation, workflow reference, and conventions for DUNE-facing Phlex work: subsystem workflow decks, a proposed data-hierarchy model, DUNE-specific conventions (units, timestamps, Python), the `dune-xerosere` pathfinder ecosystem, migration status, and the relevant DUNE/Framework-R-D repositories.

Planned site: [dune.github.io/dune-phlex-project](https://dune.github.io/dune-phlex-project/). Repository and publication status should be confirmed before enabling the deployment workflow.

Built with [Zensical](https://zensical.org), following the same pattern as [`dune-spack-project`](https://github.com/DUNE/dune-spack-project).

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

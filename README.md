# dune-phlex-project

Documentation, workflow reference, and conventions for DUNE-facing Phlex work: subsystem workflow decks, a proposed data-hierarchy model, DUNE-specific conventions (units, timestamps, Python), the `dune-xerosere` pathfinder ecosystem, migration status, and the relevant DUNE/Framework-R-D repositories.

Site: [dune.github.io/dune-phlex-project](https://dune.github.io/dune-phlex-project/)

Migrating an `art` module? Start with the Phlex developers' guide, [*Migrating to Phlex*](https://framework-r-d.github.io/phlex-examples/).

Built with [Zensical](https://zensical.org), following the same pattern as [`dune-spack-project`](https://github.com/DUNE/dune-spack-project).

Companion site: [DUNE Spack Project](https://dune.github.io/dune-spack-project/) ([repo](https://github.com/DUNE/dune-spack-project)), for Spack and MPD.

## Local development

```bash
export UV_PROJECT_ENVIRONMENT=~/venvs/dune-phlex-project  # keep the venv out of the repo
uv sync --locked
uv run --locked zensical serve
```

or with the Makefile:

```bash
make install
make serve
```

## Copyright and Licensing
Copyright © 2026 FERMI NATIONAL ACCELERATOR LABORATORY for the benefit of the DUNE Collaboration.

This repository, and all software contained within, except where noted within the individual source files, is licensed under
the Apache License, Version 2.0 (the "License"); you may not use this
file except in compliance with the License. You may obtain a copy of
the License at

    http://www.apache.org/licenses/LICENSE-2.0

Copyright is granted to FERMI NATIONAL ACCELERATOR LABORATORY on behalf
of the Deep Underground Neutrino Experiment (DUNE). Unless required by
applicable law or agreed to in writing, software distributed under the
License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for
the specific language governing permissions and limitations under the
License.

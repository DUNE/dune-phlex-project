# Contributing

This site is built with [Zensical](https://zensical.org). Content lives as plain Markdown under `docs/`.

## Setup

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
git clone <this-repo>
cd dune-phlex-project
export UV_PROJECT_ENVIRONMENT=~/venvs/dune-phlex-project  # keep the venv out of the repo
uv sync --locked
```

## Preview locally

```bash
uv run --locked zensical serve
```

## Edit or add a page

1. Edit an existing file under `docs/`, or add a new `.md` file.
2. Register new pages in `zensical.toml` so they appear in the site navigation.
3. Run `uv run --locked zensical build --clean` before opening a PR.
4. Open a PR against `main`; changes should go through review.

## Content conventions

- Mark adoption status explicitly wherever a convention or design proposal is not yet ratified.
- Cite the source behind a claim. Give the title, presenter or author, venue, date, and slide or page number where practical.
- Mark cross-source conclusions as synthesis, and distinguish direct evidence from inherited or inferred mappings.
- Link only to sources that are already public, using the public Indico talk page or official repository rather than a private or local source catalog.
- Add a `Last verified` date to claims about versions, repository state, schedules, or migration progress.

The repository-level [`CONTRIBUTING.md`](https://github.com/DUNE/dune-phlex-project/blob/main/CONTRIBUTING.md) contains the same workflow for contributors browsing on GitHub.

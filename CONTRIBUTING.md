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
2. If you add a new page, register it in `zensical.toml`'s `nav` list so it shows up in the site navigation.
3. Run `uv run --locked zensical build --clean` before opening a PR, to confirm the build is clean.
4. Open a PR against `main`. Direct pushes to `main` are not the workflow here; every change should go through review.

## Content conventions

- Mark adoption status explicitly wherever a convention or design proposal isn't yet ratified (most of what's in `docs/conventions/` falls in this category as of 2026-08-26).
- Cite the source behind a claim. Give the title, presenter or author, venue, date, and slide or page number where practical.
- Mark cross-source conclusions as synthesis, and distinguish direct evidence from inherited or inferred mappings.
- Link only to sources that are already public, using the public Indico talk page or official repository rather than a private or local source catalog.
- Add a `Last verified` date to claims about versions, repository state, schedules, or migration progress.

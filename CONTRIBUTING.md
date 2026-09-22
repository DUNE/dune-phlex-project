# Contributing

This site is built with [Zensical](https://zensical.org). Content lives as plain Markdown under `docs/`.

## Setup

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
git clone <this-repo>
cd dune-phlex-project
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
4. Open a PR against `main`. Direct pushes to `main` are not the workflow here, every change should go through review.

## Content conventions

- No em dashes. Use commas, periods, or colons.
- Mark adoption status explicitly wherever a convention or design proposal isn't yet ratified (most of what's in `docs/conventions/` falls in this category as of 2026-08-26).
- Cite the source deck or note behind a claim (presenter, venue, date) rather than presenting synthesis as though it were an official decision.

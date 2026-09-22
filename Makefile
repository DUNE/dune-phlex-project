.PHONY: install serve build check-public clean

# Keep the virtual environment outside the repository.
export UV_PROJECT_ENVIRONMENT ?= $(HOME)/venvs/dune-phlex-project

install:
	uv sync --locked

serve:
	uv run --locked zensical serve

build:
	uv run --locked zensical build --clean

check-public:
	./scripts/check-public-content.sh

clean:
	rm -rf site .cache

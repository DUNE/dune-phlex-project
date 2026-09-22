.PHONY: install serve build clean

install:
	uv sync --locked

serve:
	uv run --locked zensical serve

build:
	uv run --locked zensical build --clean

clean:
	rm -rf site .cache

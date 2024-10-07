# Settings

HTML_IGNORES=
PORT=8000
all: commands

## commands: show available commands (*)
commands:
	@grep -h -E '^##' ${MAKEFILE_LIST} \
	| sed -e 's/## //g' \
	| column -t -s ':'

## build: convert to HTML
build:
	mkdocs build
	rm -rf docs/static
	cp -r static docs/static
	python bin/compile_scss.py --verbose --theme theme --dst docs

## serve: serve generated HTML
serve:
	@python -m http.server -d docs $(PORT)

## lint: check code and project
lint:
	@html5validator --root docs --blacklist templates --ignore ${HTML_IGNORES} \
	&& echo "HTML checks passed."

## clean: clean up
clean:
	@find . -type f -name '*~' -exec rm {} \;
	@find . -type f -name .DS_Store -exec rm {} \;
	@find . -type d -name __pycache__ | xargs rm -r

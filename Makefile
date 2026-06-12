# Run commands directly on your local machine
PYTHON = python3
PIP = pip3
NPM = npm

.PHONY: setup
setup:
	$(PIP) install -r requirements.txt
	$(NPM) install

.PHONY: test
test:
	pytest

.PHONY: lint
lint:
	ruff check .
	ruff format --check .

.PHONY: build-css
build-css:
	$(NPM) run build

.PHONY: migrate
migrate:
	$(PYTHON) manage.py migrate
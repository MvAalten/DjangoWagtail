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
	docker compose exec web pytest
	docker compose exec web ruff check .
	docker compose exec web ruff check . --fix

.PHONY: fix-codestyle
fix-codestyle:
	@COMPOSE_OUTPUT_FORMAT=quiet docker compose exec web ruff check . --fix 2>/dev/null || true
	@COMPOSE_OUTPUT_FORMAT=quiet docker compose exec web ruff format . 2>/dev/null | awk '/reformatted/ || /Reformatted/' || true

.PHONY: build-css
build-css:
	$(NPM) run build

.PHONY: migrate
migrate:
	docker compose exec web python manage.py migrate

makemigrations:
	docker compose exec web python manage.py makemigrations

superuser:
	docker compose exec web python manage.py createsuperuser

up:
	docker compose up -d
#Spin up containers and force a fresh image build (great when requirements change)
build:
	docker compose up -d --build

# View real-time logs from all running containers
logs:
	docker compose logs -f

# Shut down the containers and clean up the internal networks
down:
	docker compose down

# Fast reboot of the infrastructure
restart:
	docker compose restart

# Complete purge: stops containers and deletes the Postgres database volume data
clean:
	docker compose down -v

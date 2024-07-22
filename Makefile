# Name of the Docker image
IMAGE_NAME = my-python-app

# Default target
.PHONY: all
all: help

# Help: shows the available commands
.PHONY: help
help:
	@echo "Available commands:"
	@echo "  make build              - Build the Docker image"
	@echo "  make run                - Run the container in production mode"
	@echo "  make dev                - Run the container in development mode with debug"
	@echo "  make stop               - Stop the container"
	@echo "  make clean              - Clean up Docker images and containers"
	@echo "  make logs               - Show logs from the running container"

# Build the Docker image
.PHONY: build
build:
	docker-compose build

# Run the container in production mode
.PHONY: run
run:
	docker-compose up -d

# Run the container in development mode with debug
.PHONY: dev
dev: build-dev
	docker-compose -f docker-compose-develop.yml up --build -d
	docker-compose -f docker-compose-develop.yml exec web python -m debugpy --listen 0.0.0.0:5678 --wait-for-client app/app.py

# Build the Docker image with development dependencies
.PHONY: build-dev
build-dev:
	docker-compose -f docker-compose-develop.yml build

# Stop the running container
.PHONY: stop
stop:
	docker-compose down

# Clean up Docker images and containers
.PHONY: clean
clean:
	docker-compose down -v --rmi all --remove-orphans

# Show logs from the running container
.PHONY: logs
logs:
	docker-compose logs -f

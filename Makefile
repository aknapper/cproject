# Define the Docker image name and tag
PROJECT_NAME = cproject
IMAGE_NAME = ${PROJECT_NAME}-builder
IMAGE_TAG = latest
DOCKERFILE = builder.Dockerfile

# Define the build target
.PHONY: build
build:
	docker build -f $(DOCKERFILE) \
		-t $(IMAGE_NAME):$(IMAGE_TAG) \
		.

# Run the build target
.PHONY: run
run:
	docker run \
		--rm \
		-it \
		--platform linux/amd64 \
		cproject-builder:latest \
		/bin/bash

# Define the clean target
.PHONY: clean
clean:
	-docker rmi $(IMAGE_NAME):$(IMAGE_TAG)

# Define the help target
.PHONY: help
help:
	@echo "Makefile for building Docker images"
	@echo "Usage:"
	@echo "  make build       Build the Docker image"
	@echo "  make run         Run the Docker image"
	@echo "  make clean       Remove the Docker image"
	@echo "  make help        Show this help message"

# Default target
.DEFAULT_GOAL := help

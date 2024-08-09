# Define the Docker image name and tag
PROJECT_NAME = cproject
IMAGE_NAME = ${PROJECT_NAME}-builder
IMAGE_TAG = latest
DOCKERFILE = builder.Dockerfile

# Define the container-build target
.PHONY: container-build
container-build:
	docker build -f $(DOCKERFILE) \
		-t $(IMAGE_NAME):$(IMAGE_TAG) \
		.

# Run the container-run target
.PHONY: container-run
container-run:
	docker run \
		--rm \
		-it \
		--platform linux/amd64 \
		--workdir /builder/mnt \
		-v ${PWD}/:/builder/mnt \
		cproject-builder:latest \
		/bin/bash

# Define the container-clean target
.PHONY: container-clean
container-clean:
	-docker rmi $(IMAGE_NAME):$(IMAGE_TAG)

# Define the test target
.PHONY: test
test:
	cd tests/unittest && ceedling test:all && ceedling gcov:all && ceedling utils:gcov

.PHONY: clean
clean:
	rm -rf build tests/unittest/build

# Define the help target
.PHONY: help
help:
	@echo "Makefile for building Docker images"
	@echo "Usage:"
	@echo "  make container-build	Build the Docker image"
	@echo "  make container-run	Run the Docker image"
	@echo "  make container-clean	Remove the Docker image"
	@echo "  make test		Execute unit tests and generate coverage reports"
	@echo "  make clean		Clean bins and tests"
	@echo "  make help		Show this help message"

# Default target
.DEFAULT_GOAL := help

# CProject
## Building Project
```bash
cmake -B build
cmake --build build -- -j
```

## Container and UnitTest Usage
```shell
$ make help
Makefile for building the container and unit tests
Usage:
    make container-build    Build the Docker image
    make container-run      Run the Docker image
    make container-clean    Remove the Docker image
    make test               Execute unit tests and generate coverage reports.
    make clean              Clean bins and tests
    make help               Show this help message
```

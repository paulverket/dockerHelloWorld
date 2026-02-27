# Goal Description
Create a C++ project that prints "Hello World" to the console, builds via CMake and g++, and runs in a Docker container based on the `ubi9` image using `docker-compose`.

## Proposed Changes
### Source Code & Build Configuration
#### [NEW] [main.cpp](file:///Users/verket/Projects/dockerHelloWorld/main.cpp)
A simple C++ file that prints "Hello World\n".

#### [NEW] [CMakeLists.txt](file:///Users/verket/Projects/dockerHelloWorld/CMakeLists.txt)
CMake configuration for the project, specifying the executable and standard.

### Docker Environment
#### [NEW] [Dockerfile](file:///Users/verket/Projects/dockerHelloWorld/Dockerfile)
Uses `registry.access.redhat.com/ubi9/ubi` as the base image. Installs `gcc-c++`, `make`, and `cmake` via `dnf`, copies the source code, builds the project using CMake, and sets the entrypoint to the compiled executable.

#### [NEW] [docker-compose.yml](file:///Users/verket/Projects/dockerHelloWorld/docker-compose.yml)
Defines a service that builds the Dockerfile and runs the resulting container.

## Verification Plan
### Automated Tests
Run `docker-compose build` and `docker-compose up` using `run_command` to verify that the container builds successfully and prints "Hello World" to the standard output.

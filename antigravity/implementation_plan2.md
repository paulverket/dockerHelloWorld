# Goal Description
Update the Dockerfile to use a multi-stage build so that the final container only contains the compiled executable and the base image, without all of the build tools (gcc, make, cmake).

## Proposed Changes
### Docker Environment
#### [MODIFY] [Dockerfile](file:///Users/verket/Projects/dockerHelloWorld/Dockerfile)
Change the Dockerfile to use two stages:
1.  **Builder stage**: based on `registry.access.redhat.com/ubi9/ubi:latest` (aliased as `builder`). Install dependencies, copy the source code, and use CMake to build the project.
2.  **Final stage**: based on `registry.access.redhat.com/ubi9/ubi:latest` (or `ubi9-minimal` if preferred, but keeping `ubi9/ubi` for consistency with the prompt). We will not install any build tools. Instead, we'll copy the compiled `dockerHelloWorld` executable from the `builder` stage, set the working directory, and set the entrypoint.

## Verification Plan
### Automated Tests
Run `docker compose up --build` to verify that the container still builds successfully and prints "Hello World" to the standard output.
We can also optionally run `docker images | grep docker-hello-world` to visually inspect that the resulting image size is smaller than the original non-multi-stage image.

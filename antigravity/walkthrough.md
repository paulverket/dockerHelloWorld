# Docker Hello World Multi-Stage Build

## Summary

The [Dockerfile](file:///Users/verket/Projects/dockerHelloWorld/Dockerfile) has been successfully updated to use a **multi-stage build process**. This change isolates the heavy build tools from the final runtime image. 

- **Builder Stage**: `registry.access.redhat.com/ubi9/ubi:latest` - Used to install `gcc-c++`, `make`, and `cmake`, then compile the C++ source code.
- **Runtime Stage**: `registry.access.redhat.com/ubi9/ubi-minimal:latest` - A fresh, minimal base image where we simply copy the compiled executable from the builder stage and set the entrypoint.

## Validation Results

1.  **Functionality:** The container runs successfully and outputs `Hello World` as expected via `docker compose up --build`.
2.  **Size Reduction:** The final image size is now **109 MB**, which is a significant reduction from the original **455.81 MB**. This makes the container much more lightweight and secure by removing unnecessary build dependencies from the final product!

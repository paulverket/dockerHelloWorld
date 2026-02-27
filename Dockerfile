# Builder stage
FROM registry.access.redhat.com/ubi9/ubi:latest AS builder

# Install build tools
RUN dnf install -y gcc-c++ make cmake && \
    dnf clean all

# Set working directory
WORKDIR /app

# Copy source code and CMake configuration
COPY . /app

# Configure and build the project
RUN cmake -S . -B build && \
    cmake --build build

# Final runtime stage
FROM registry.access.redhat.com/ubi9/ubi-minimal:latest

# We might need libstdc++ if the executable is dynamically linked to it,
# but for a simple "Hello World" using standard library, we will see if we need it.
# We will just copy the binary and try it.
WORKDIR /app

COPY --from=builder /app/build/dockerHelloWorld /app/dockerHelloWorld

# Set the entrypoint
CMD ["./dockerHelloWorld"]

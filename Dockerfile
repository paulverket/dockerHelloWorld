FROM registry.access.redhat.com/ubi9/ubi:latest

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

# Set the entrypoint to run the compiled executable
CMD ["./build/dockerHelloWorld"]

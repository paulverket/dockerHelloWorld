This is a test project to see how well Antigravity can create a project from scratch.

```markdown
Create a C++ project that prints "Hello World" to the console and can be run in a Docker container.
The project should be able to be built and run using Docker.
The docker container should use ubi9 as the base image.
Use g++ to compile the C++ code.
Use cmake to build the project.
Use docker-compose to run the project.
```

Resulting docker image was 455.81 MB

```markdown
Run the built code in a container without the build tools. Use ubi9-minimal for the runtime image.
```

Resulting docker image was 108.84 MB

```markdown
I've placed the work so far in github.
Next try using jenkins and github actions to build using 
an aws vm with 
docker and upload the resulting image to docker.com.

github account: https://github.com/paulverket/dockerHelloWorld
jenkins account: http://ec2-52-53-129-183.us-west-1.compute.amazonaws.com:8080
docker account: docker.com - verket
```

## CI/CD Setup

### GitHub Actions
It is hosted and run entirely by GitHub.
It is automatically triggered whenever you git push new code to the main, master or github-workflow branches, or when you open a Pull Request.

A workflow is configured in `.github/workflows/docker-build-push.yml`.
To use it, you must configure the following repository secrets:
- `DOCKER_USERNAME`: Your Docker Hub username (`verket`)
- `DOCKER_PASSWORD`: Your Docker Hub password or Personal Access Token (PAT).


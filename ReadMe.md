This is a test project to see how well Antigravity can create a project from scratch.

 Create a C++ project that prints "Hello World" to the console and can be run in a Docker container.
 The project should be able to be built and run using Docker.
 The docker container should use ubi9 as the base image.
 Use g++ to compile the C++ code.
 Use cmake to build the project.
 Use docker-compose to run the project.

Resulting docker image was 455.81 MB

 Run the built code in a container without the build tools. Use ubi9-minimal for the runtime image.

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

There are two options for CI/CD. The GitHub actions implementation is saved in the branch `github-workflow` and the Jenkins implementation is saved in the main branch.

### GitHub Actions
It is hosted and run entirely by GitHub.
It is automatically triggered whenever you git push new code to the main, master or github-workflow branches, or when you open a Pull Request.

A workflow is configured in `.github/workflows/docker-build-push.yml`.
To use it, you must configure the following repository secrets:
- `DOCKER_USERNAME`: Your Docker Hub username (`verket`)
- `DOCKER_PASSWORD`: Your Docker Hub password or Personal Access Token (PAT).

### Jenkins
It is hosted and run entirely on your AWS VM.
In order for it to run, you have to go into the Jenkins dashboard in your web browser, set up a new Pipeline job that points to your GitHub repository, and click "Build Now".

go into your GitHub repository settings and add a "Webhook". This tells GitHub "Hey, whenever I push code, send a quick internet notification to my Jenkins server URL." When Jenkins receives that ping, it automatically starts the **Jenkinsfile** pipeline.
 
Jenkins reads the **Jenkinsfile**
 from the code it downloaded to figure out what commands to run.

A `Jenkinsfile` is provided in the repository root for use with your Jenkins server.
1. Create a **Pipeline** job in Jenkins.
2. In the Pipeline section, select **Pipeline script from SCM** and configure your Git repository URL.
3. Configure the **Script Path** as `Jenkinsfile`.
4. Add a "Username with password" credential in Jenkins with the ID exactly `docker-hub-credentials`.
   - Username: `verket`
   - Password: `<your_docker_hub_password_or_token>`


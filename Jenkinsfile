pipeline {
    agent any

    environment {
        // ID of the credentials stored in Jenkins
        DOCKER_CREDS_ID = 'docker-hub-credentials'
        
        // Define repository name. Replace 'verket' if necessary, though 'verket' is requested
        IMAGE_NAME = "verket/docker-hello-world"
        IMAGE_TAG = "latest"
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout from SCM if using multibranch pipeline
                // otherwise explicit git checkout might be needed
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker Image: ${IMAGE_NAME}:${IMAGE_TAG}"
                    
                    // The machine needs 'docker' installed. The prompt says aws vm has docker.
                    sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    echo "Pushing Docker Image to Docker Hub"

                    // Use Jenkins credential binding to authenticate
                    withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDS_ID}", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        // Login securely
                        sh "echo \$DOCKER_PASS | docker login -u \$DOCKER_USER --password-stdin"
                        
                        // Push image
                        sh "docker push ${IMAGE_NAME}:${IMAGE_TAG}"

                        // Optional: logout
                        sh "docker logout"
                    }
                }
            }
        }
    }
    
    post {
        always {
            script {
                // Cleanup local image to save space
                sh "docker rmi ${IMAGE_NAME}:${IMAGE_TAG} || true"
            }
        }
        success {
            echo "CI/CD Pipeline Completed Successfully."
        }
        failure {
            echo "CI/CD Pipeline Failed."
        }
    }
}

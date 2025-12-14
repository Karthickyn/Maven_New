pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                git 'https://github.com/your-username/maven-project.git'
            }
        }

        stage('Build WAR using Maven Container') {
            steps {
                sh '''
                docker run --rm \
                  -v $WORKSPACE:/app \
                  -w /app \
                  maven:3.9.6-eclipse-temurin-17 \
                  mvn clean package
                '''
            }
        }

        stage('Build & Deploy Tomcat') {
            steps {
                sh '''
                docker rm -f webapp || true
                docker build -t webapp-tomcat .
                docker run -d -p 9090:8080 --name webapp webapp-tomcat
                '''
            }
        }
    }
}

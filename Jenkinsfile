pipeline {
    agent any

    tools {
        maven = 'maven3'
    }
    environment {
        SCANNER_HOME = tool 'sonar'
    }
     triggers {
        pollSCM('* * * * *')
    }
    options {
        timeout(time: 30, unit: 'MINUTES')
    }
    stages {
        stage('Git Checkout') {
            steps {
                git url: 'https://github.com/gopi8324/spring-petclinic.git',
                    branch: 'main'
            }
        }
        stage('Compile') {
            steps{
                sh 'mvn compile'
            }
        }
        stage('Test') {
            steps{
                sh 'mvn test'
            }
        }
        stage('File System Scan') {
            steps {
                sh 'trivy fs --format table -o trivy-fs-report.html .'
            }
        }
        stage('SonarQube Analsyis') {
            steps {
                withSonarQubeEnv('sonar') { 
                     sh "$SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=gopi -Dsonar.projectkey=spring -Dsonar.java.binaries=target"
                }
            }
        }
        stage('Build') {
            steps {
            sh 'mvn package'
            }
        }
        stage('Publish to Nexus') {
            steps {
                withMaven(globalMavenSettingConfig:'settings-maven',jdk ",maven: 'maven3',mavenSetttingsConfig:",traceability: true) {
                    sh "mvn deploy"
                }
            }
        }
        stage('Build  docker image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'Docker')
                    sh "docker build -t springpectclinic:3.3.0 ."
                }
            }
        }
        stage('Docker image Scan') {
            steps {
                sh 'trivy image --format table -o trivy-fs-report.html springpectclinic:3.3.0 '
            }
        }
        stage('Push image to repository') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'Docker')
                    sh "docker push springpectclinic:3.3.0 "
                }
            }
        }
    }
}
pipeline {
    agent any
    tools {
        maven 'maven3'
    }
    
    stages {
        stage('Git checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/gopi8324/spring-petclinic.git'
            }
        }
        stage('code compile') {
            steps {
                sh 'mvn compile -Dcheckstyle.skip=true'
            }
        }
        stage('code test') {
            steps {
                sh 'mvn test -Dcheckstyle.skip=true'
            }
        }
        stage('package code') {
            steps {
                sh 'mvn package -Dcheckstyle.skip=true'
            }
        }
        stage('Deploy into Nexus') {
            steps {
                withMaven(globalMavenSettingsConfig: 'settings.xml', jdk: 'jdk17', maven: 'maven3', mavenSettingsConfig: '', traceability: true) {
                sh 'mvn deploy -Dcheckstyle.skip=true'
                }
            }
        }
    }
}

pipeline {
    agent any
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
        stage('Build') {
            steps{
                sh 'mvn clean'
                sh 'mvn package'
            }
        }
        stage('Test') {
            steps{
                sh 'mvn test'
            }
            post {
                always {
                    archiveArtifacts artifacts: '**/spring-petclinic-*.jar'
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
    }
}
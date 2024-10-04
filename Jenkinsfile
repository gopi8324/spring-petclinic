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
                withSonarQubeEnv('Sonar') { 
                     sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=gopi -Dsonar.projectkey=spring \
                    
                      -Dsonar.java.binaries =. '''
                }
                jnit testResults: '**/surefire-reports/*.xml'
            }
        }
        stage('Quality gate') {
            steps {
                waitForQualityGate abortPipeline: true, credentialsId: 'sonar-token'
            }
        }
        stage('Build') {
            steps {
            sh 'mvn package'
            }
        }
    }
}
pipeline {
    agent any
    options {
        timeout(time: 30, unit: 'MINUTES') 
    }
    triggers {
        pollSCM('* * * * *')
    }
    stages {
        stage('scm') {
            steps {
                git url: 'https://github.com/gopi8324/spring-petclinic.git',
                branch: 'main'
            }
        
        }
        stage('build') {
            steps {
                sh 'mvn package'
                jUnit testResults: '**/TEST-*.xml'
                archiveArtifacts artifacts: '**/spring-petclinic-*.jar'
            }
        }
    }
}
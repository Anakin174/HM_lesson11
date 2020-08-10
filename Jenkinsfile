pipeline {
    agent any
    tools {
        maven "m3"
    }
    stages {
        stage('git') {
            steps {
                echo 'Clone git repo'
                git 'https://github.com/Anakin174/boxfuse.git'
            }
        }
        stage('build') {
            steps {
                echo 'Build mvn'
                sh 'mvn package'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying Boxfuse.'
                deploy adapters: [tomcat8(credentialsId: '2c73749e-8a4e-4b16-a9d8-31b09e2486f5', path: '', url: 'http://84.201.138.247:8080/')], contextPath: 'mywebapp', war: '**/*.war'
            }
        }
    }
}
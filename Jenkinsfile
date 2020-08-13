pipeline {
    environment {
        registry = "anakin174/mvnbuild"
        registryCredential = 'dockerhub_id'
        dockerImage = ''
    }
    agent any

    stages {
        stage('Get git repo') {
            steps {
                git clone 'https://github.com/Anakin174/boxfuse.git'
            }
        }

        stage('Build maven project') {
            steps {
                sh 'mvn -f /pom.xml clean package'
            }
        }

         stage('Building our image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":v1"
                }
            }
        }

         stage('Deploy our image') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy war file') {
            steps {
                deploy adapters: [tomcat8(credentialsId: '2c73749e-8a4e-4b16-a9d8-31b09e2486f5', path: '', url: 'http://84.201.138.247:8080/')], contextPath: 'mywebapp', war: '**/*.war'
            }
        }
    }
}
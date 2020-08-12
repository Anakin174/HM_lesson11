pipeline {
    agent {
      docker {
      image 'YOU_REGISTRY'
            }
          }
        }

    stages {
        stage('Get git repo') {
            steps {
                echo 'Clone git repo'
                git 'https://github.com/Anakin174/boxfuse.git'
            }
        }
        stage('Build maven project') {
            steps {
                echo 'Build mvn'
                sh 'mvn clean package'
            }
        }
        stage('Deploy war file') {
            steps {
                echo 'Deploying Boxfuse.'
                deploy adapters: [tomcat8(credentialsId: '2c73749e-8a4e-4b16-a9d8-31b09e2486f5', path: '', url: 'http://84.201.138.247:8080/')], contextPath: 'mywebapp', war: '**/*.war'
            }
        }
    }
}
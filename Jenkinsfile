pipeline {
       agent {
        docker {
            image 'anakin174/mvnbuild'
			args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
			registryCredentialsId 'dockerhub'
        }
}
    stages {

        stage ('Get git repo') {
            steps {
                git 'https://github.com/Anakin174/boxfuse.git'
            }
        }

        stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

         stage ('Build image and push to dockerhub') {
            steps {
                sh 'docker build --tag=anakin174/boxfuse .'
                sh 'docker push anakin174/boxfuse'
            }
        }


        stage ('Deploy') {
            steps {
                sshagent (credentials: ['ssh']) {
                    sh 'ssh root@18.224.23.217 && docker pull anakin174/boxfuse && docker run -d -p 8282:8080 boxfuse'
                }
            }
        }
    }
}


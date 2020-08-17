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

        stage ('Create image') {
            steps {
                sh 'docker volume create -d local --name artifact && cp /boxfuse/target/*.war var/lib/docker/volume/artifact/_data && docker run -d -v artifact:/usr/local/tomcat/webapps --name app tomcat:latest && docker commit boxfuse boxfuse'
            }
        }

        stage ('Push image') {
            steps {
                sh ' docker tag boxfuse anakin174/boxfuse && docker push anakin174/boxfuse'
            }
        }

        stage ('Deploy') {
            steps {
                sshagent (credentials: ['ssh']) {
                    sh 'ssh root@18.224.23.217 && docker pull anakin174/boxfuse && docker run -d boxfuse'
                }
            }
        }
    }
}


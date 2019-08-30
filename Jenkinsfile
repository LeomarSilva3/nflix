pipeline {
    agent {
        docker {
            image "ruby"
        }
    }
    stages {
        stage("Build") {
            steps {
                sh "bundler install"
            }
        }
        stage("Testes"){
            steps {
                sh "echo 'simulando um teste automatizado'"
            }
        }
    }
}
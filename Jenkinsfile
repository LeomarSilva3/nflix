pipeline {
    agent {
        docker {
            image "ruby"
        }
       
    }

    stages {
        stage("Build") {
            steps {
                sh "echo 'simulando um build'"
            }
        }
        stage("Testes"){
            steps {
                sh "bundle exec cucumber'"
            }
        }
    }
}
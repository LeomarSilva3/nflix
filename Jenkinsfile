pipeline {
    agent {
        docker {
            image "ruby:alpine"
            args "--network=skynet"
        }
       
    }
    stages {
        stage("Build") {
            steps {
                sh "chmod +x build/alpine.sh"
                sh "./build/alpine.sh"
                sh "gem install bundler:2.0.2"
                sh "bundle install"
            }
        }
        stage("Testes"){
            steps {
                sh "bundle exec cucumber -t @login_happy -p ci"
            }
            post {
                always {
                    cucumber fileIncludePattern: '**/*.json', jsonReportDirectory: 'log', sortingMethod: 'ALPHABETICAL'
                }
            }
        }
    }
}
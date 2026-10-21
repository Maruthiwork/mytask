
pipeline {
    agent any

    options {
        disableConcurrentBuilds()
        timestamps()
    }

    triggers {
        githubPush()
    }

    environment {
        COMPOSE_PROJECT_NAME = 'mytask'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    credentialsId: 'ffd34098-61dd-47a2-8c02-c51e1a634c01',
                    url: 'https://github.com/Maruthiwork/mytask.git'
            }
        }

        stage('Validate Compose') {
            steps {
                sh 'docker compose config -q'
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker compose build'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker compose up -d --no-deps'
            }
        }

        stage('Verify') {
            steps {
                sh 'docker compose ps'
            }
        }
    }
}

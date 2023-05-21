pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                sh 'docker build -t integrating_jenkins3 .'
            }
        }
        
        stage('Test') {
            steps {
                sh 'docker run integrating_jenkins3 python -m unittest'
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                    sh 'docker tag integrating_jenkins3 bayanaltaleb/integrating_jenkins3:latest'
                    sh 'docker push bayanaltaleb/integrating_jenkins3:latest'
                }
            }
        }
    }
}

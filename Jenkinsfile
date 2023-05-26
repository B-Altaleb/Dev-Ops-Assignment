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
                sh 'docker build -t bayanaltaleb/integrating_jenkins5 .'
            }
        }
        
        stage('Test') {
            steps {
                sh 'docker run bayanaltaleb/integrating_jenkins5 python -m unittest'
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                sh 'docker tag integrating_jenkins5 $DOCKER_USERNAME/integrating_jenkins5'
                sh 'docker push $DOCKER_USERNAME/integrating_jenkins5'
            }
        }
    }
}

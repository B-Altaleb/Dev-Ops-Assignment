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
                sh 'docker build -t bayanaltaleb/integrating_jenkins3 .'
            }
        }
        
        stage('Test') {
            steps {
                sh 'docker run bayanaltaleb/integrating_jenkins3 python -m unittest'
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'DockerhubPasswprd', variable: 'Dockerhubpassword')]) {
                    sh 'docker login -u bayanaltaleb -p ${Dockerhubpassword}' 
                    sh 'docker tag integrating_jenkins3 bayanaltaleb/integrating_jenkins3:latest'
                    sh 'docker push bayanaltaleb/integrating_jenkins3:latest'
                }
            }
        }
    }
}

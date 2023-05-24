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
                sh 'docker build -t bayanaltaleb/integrating_jenkins4 .'
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
                    sh 'docker login -u bayanaltaleb -p Salamozo@83' 
                  //  sh 'docker tag integrating_jenkins4 bayanaltaleb/integrating_jenkins4:latest'
                    sh 'docker push bayanaltaleb/integrating_jenkins4:latest'
                }
            }
        }
    }
}

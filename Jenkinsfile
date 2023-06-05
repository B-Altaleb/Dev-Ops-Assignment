pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                //checkout scm
                git branch: 'main', url: 'https://github.com/B-Altaleb/DevOpsAssignment.git'
            }
        }
        
        stage('Build') {
            steps {
                echo 'BUILDING STEP'
                //sh 'docker build -t integrating_jenkins77 .'
                dockerImage.push('your-docker-registry/your-image-name')
            }
        }
        
       stage('Test') {
            steps {
                echo 'TESTING STEP'
                //sh 'docker run integrating_jenkins77 python -m unittest'
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                echo 'PUSHING STEP'
                //withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                //    sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                //    sh 'docker tag integrating_jenkins5 $DOCKER_USERNAME/integrating_jenkins77'
                //    sh 'docker push $DOCKER_USERNAME/integrating_jenkins77'
                
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    kubernetesDeploy(
                        kubeconfigId: 'my-kubeconfig-credentials',
                        configs: 'jenkins-k8-deployment.yml',
                        enableConfigSubstitution: true
                    )
                }
            }
        }
    }
}


pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout source code from Git repository 'yyy'
                git branch: 'main', url: 'https://github.com/B-Altaleb/student_project.git'
            }
        }
        
        stage('Build') {
            steps {
                script {
                    // Define the Docker image name
                    def imageName = "myimage"
                    
                    // Build the Docker image
                    docker.build(imageName)
                    
                    // Push the Docker image to a registry (optional)
                    //docker.withRegistry('<your-registry-url>') {
                    //    docker.image(imageName).push()
                    }
                }
            }
        }
    }
}

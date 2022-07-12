pipeline{
    
    environment{
        
        registry = "partha00011/simple_web_app"
        registryCredential = 'dockerhub-account'
        dockerImage = ''
        anotherTag= 'latest'
    }
    
    agent any
    
    stages{
        
        stage('cloning the repo'){
            
            steps{
                git 'https://github.com/parthaSdeb/simple_web_project.git'
            }
        }
        
        stage('build image from dockerfile'){
            
            steps{
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
                
            }
        }
        
        stage('pushing image to dockerhub'){
            
            steps{
                
                script {
                    
                    docker.withRegistry( '', registryCredential ){
                        dockerImage.push()
                    }
                }
            }
        }
        
        stage('deploying application'){
            
            steps{
                
                sh "sed -i s,partha00011/simple_web_app,partha00011/simple_web_app:${BUILD_NUMBER},g simple-web-app.yaml"

                sh "kubectl apply -f simple-web-app.yaml"
            }
        }
        
        stage('cleaning up image'){
            
            steps{
                
                sh "docker rmi $registry:$BUILD_NUMBER" 
                
            }
        }
    }
}

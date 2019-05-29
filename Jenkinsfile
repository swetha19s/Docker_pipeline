pipeline{
           agent any
               environment {
                       IMAGE = "deploy_docker"
                   }
            stages{
                   stage('code checkout'){
                     steps{
                          git url:'https://github.com/swetha19s/Docker_pipeline.git',branch:'master'
                          }
                        }
                       stage('maven'){
                                  steps{
                                           sh ' mvn clean install'
                                            }
                                 }
                       stage('Docker deploy'){
                                  steps{
                                         sh 'cd /home/ec2-user'
                                         sh 'docker -v'
                                         sh 'docker build -t deploy .'
                                         sh 'docker run -d -p 8888:8080 deploy'
                                    }
                                  }
                       
            }
           
           }
              
                    

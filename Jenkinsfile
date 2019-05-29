pipeline{
           agent any
          
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
                                  agent {label 'Docker_agent'}
                                     steps{
                                       sh 'cd /home/ec2-user/Swetha/'
                                       sh 'sudo docker build -t deploy .'
                                       sh 'sudo docker run -d -p 8888:8080 deploy'
            }
        }
                       
            }
           
           }
              
                    

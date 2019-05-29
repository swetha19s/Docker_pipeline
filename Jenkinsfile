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
                                  steps{
                                     
                                         sh 'docker -v'
                                         sh 'docker build -t deploy .'
                                         sh 'docker run -d -p 8888:8080 deploy'
                                    }
                                  }
                       
            }
           
           }
              
                    

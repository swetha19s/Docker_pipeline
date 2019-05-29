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
                                    script{
                                        def image = docker.build("${IMAGE}")
                                        def cont = image.run('--name testing -p 8082:8080')
                                    }
                                  }
                       }
            }
           
           }
              
                    

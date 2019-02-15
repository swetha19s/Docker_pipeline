pipeline{
            agent{label 'Docker_AWS_Slave'}
            stages{
                   stage('code checkout'){
                     steps{
                          git url:'https://github.com/tarakaharish/Docker_pipeline.git',branch:'master'
                          }
                        }
                    stage('build image'){
                    agent{
                          dockerfile{
                                     filename "Dockerfile"
                                     label "Docker_AWS_Slave"
                                     }
                           }
                      steps{
                      sh 'mvn clean compile package'
                      sh 'mvn sonar:sonar -Dsonar.host.url=http://13.232.233.79:9000'
                      sh 'curl -v --user admin:admin123 --upload-file "**/target/*.war" http://13.232.233.79:8081/repository/SimpleWebapp/*.war'
                      }
                      }
                  }
    }            
                    

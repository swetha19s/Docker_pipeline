pipeline{
            agent{label 'Docker_AWS_Slave'}
            environment {
        IMAGE = "container"
     }
            stages{
                   stage('code checkout'){
                     steps{
                          git url:'https://github.com/tarakaharish/Docker_pipeline.git',branch:'master'
                          }
                        }
                    stage('build image and war file'){
                    agent{
                          dockerfile{
                                     filename "Dockerfile"
                                     label "Docker_AWS_Slave"
                                     }
                           }
                      steps{
                      sh 'mvn clean compile package'
                      }
                      }
                        stage('code analysis'){
                                    agent {label 'Docker_AWS_Slave'}
                                    steps{
                                                script{
                                                             def image = docker.build("${IMAGE}")
                                                            container.inside{
                                                                         sh 'mvn sonar:sonar -Dsonar.host.url=http://13.232.233.79:9000'
                                                            }
                                                }
                        }
                  }
                stage('binary management'){
                                    agent {label 'Docker_AWS_Slave'}
                                    steps{
                                                script{
                                                            container.inside{
                                                                        sh 'curl -v --user admin:admin123 --upload-file "$PWD/target/mavenwebApp.war" http://13.232.233.79:8081/repository/SimpleWebapp/Docker_jenkins.war'
                                                            }
                                                }
                        }
                  }        
    }            
}                  

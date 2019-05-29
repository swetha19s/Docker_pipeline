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
                       stage('Upload artifacts'){
                                  steps{
           rtUpload (
                     serverId: "Artifactory",
                     spec:
                     """{
                     "files": [
                     {
                     "pattern": "/var/lib/jenkins/workspace/artifactory/target/*.war",
                     "target": "example-repo-local"
                     }
                     ]
                     }"""
)
                                  }
             
                       }
                       stage('Docker'){
                       steps{
                                 sh 'docker -v'
                                  sh 'cd /var/lib/jenkins/workspace/Build_Deploy'
                                  sh 'sudo docker build -t deploy .'
                                  sh 'sudo docker run -d -p 8888:8080 deploy'
                       }
            }
            }
           
           }
              
                    

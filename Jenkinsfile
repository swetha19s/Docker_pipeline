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
                        stage('Download artifacts'){
                                  steps{                      
                                        rtDownload (
                                            serverId: "Artifactory",
                                            spec:
                                                """{
                                                  "files": [
                                                    {
                                                      "pattern": "example-repo-local/*.war",
                                                      "target": "/var/lib/jenkins/workspace/artifactory/target,
                                                    }
                                                 ]
                                                }"""
                                        )
                                  }
                        }
                       stage('Docker'){
                                  steps{
                                     sh 'cd /var/lib/jenkins/workspace/Build_Deploy'
                                     sh 'docker build -t deploy .'
                                     sh 'docker run -d -p 8888:8080 deploy'
                       }
            }
            }
           
           }
              
                    

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
            }
           
           }
              
                    

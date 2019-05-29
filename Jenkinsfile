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
           rtUpload (
 serverId: "http://13.67.56.156:8081/artifactory/webapp/#/artifacts/browse/tree/General/example-repo-local",
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
              
                    

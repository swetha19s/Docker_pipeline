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
            }
           post{
                      failure{
                                 
                                 junit (
                                  testResults: '**/surefire-reports/*.xml',
                                  testDataPublishers: [
                                    jiraTestResultReporter(
                                      configs: [
                                        jiraStringField(fieldKey: 'summary', value: '${DEFAULT_SUMMARY}'),
                                        jiraStringField(fieldKey: 'description', value: '${DEFAULT_DESCRIPTION}'),
                                        jiraStringArrayField(fieldKey: 'labels', values: [jiraArrayEntry(value: 'Jenkins'), jiraArrayEntry(value:'Integration')])
                                      ],
                                      projectKey: 'NMS',
                                      issueType: '1',
                                      autoRaiseIssue: false,
                                      autoResolveIssue: false,
                                      autoUnlinkIssue: false,
                                    )
                                  ]
                                 )
                      }
           }
}
              
                    

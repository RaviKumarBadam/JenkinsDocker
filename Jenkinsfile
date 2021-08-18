pipeline{
    agent any
    tools {
      maven 'maven1'
          }
    stages{
        stage('SCM'){
            steps{
                git credentialsId: 'github', 
                    url: 'https://github.com/RaviKumarBadam/dockeransiblejenkins'
                 }
                   }
        stage('Maven Build'){
            steps{
                sh "mvn clean package"
                 }
                            }
           }
        }


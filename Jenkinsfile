pipeline{
    agent any
    tools {
        maven 'maven1'
    }
    environment {
        ver = getVersion()
    }
    stages{
        stage('SCM'){
            steps{
                 git credentialsId: 'github', 
                 url: 'https://github.com/RaviKumarBadam/dockeransiblejenkins.git'
            }
        }
        
        stage('Maven Build'){
            steps{
                sh "mvn clean package"
            }
        }
        
        stage('Docker Build'){
            steps{
                sh "docker build . -t rkb00856/ravi_cm_project:${ver}"
            }
        }
        
        stage('DockerHub Push'){
            steps{
                withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerhubpwd')]) {
                sh "docker login -u rkb00856 -p ${dockerhubpwd}"
                }
                sh "docker push rkb00856/ravi_cm_project:${ver}"
            }
        }
        
        stage('Docker Deploy'){
            steps{
                ansiblePlaybook credentialsId: 'deploy-server', disableHostKeyChecking: true, extras: "-e ver=${ver}", installation: 'ansible', inventory: 'deploy.inv', playbook: 'deploy_docker_container.yml'
            }
        }
        
        
    }
}

def getVersion(){
    def verVariable=sh returnStdout: true, script: 'git rev-parse --short HEAD'
    return verVariable
}

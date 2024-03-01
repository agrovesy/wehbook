pipeline{
    agent any
    stages{
        stage("clean up"){
            steps{
                sh "bash clean.sh || true"
            }
        }
        stage("build "){
            steps{
                sh "chmod +x deploy.sh"
                sh "bash deploy.sh"
            }
        }
    }
}
pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                 git url:'https://github.com/ShroukRamadan/Devops-Challenge-01/tree/master/IaC-Terraform',
                 branch:'main',
                 credentialsId:'github-cred'
            }
        }
        stage('terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('terraform Apply') {
            steps {
                sh """
                
                terraform apply -auto-approve -no-color
                terraform apply -auto-approve -no-color

                
            
                """
            }
        }
    }
} 
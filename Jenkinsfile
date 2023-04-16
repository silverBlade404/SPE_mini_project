pipeline {
    tools {
        maven "Maven"
    }

    agent any

    environment
    {
        registry = "anirudhgupta000/calculator"
        registryCredential = "dockerhub"
        dockerImage = ""
    }

    stages {
        stage('Pull GitHub') {
            steps {
                git branch: 'main', url: 'https://github.com/silverBlade404/SPE_mini_project'
            }
        }
        stage('Build Maven jar package') {
            steps {
                dir("") {
                    script{
                        sh 'mvn clean install'
                    }
                }
            }
        }
        stage('Docker Image Build') {
            steps {
                script {
                    dockerImage = docker.build(registry + ":latest")
                }
            }
        }
        stage('DockerHub Image Push') {
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Cleaning Up') {
            steps {
                sh "docker rmi $registry:latest"
            }
        }
        stage('Execute Ansible') {
            steps {
                ansiblePlaybook colorized: true,
                installation: 'Ansible',
                inventory: 'inventory',
                playbook: 'playbook.yml'
            }
        }
    }
}
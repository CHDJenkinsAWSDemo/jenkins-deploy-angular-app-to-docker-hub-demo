pipeline {
    agent any

    stages {
        stage('SCM Checkout') {
            steps {
                git branch: 'main', credentialsId: 'dockerhub_id', url: 'https://github.com/JenkinsCiCdDemo/jenkins-pipeline-to-create-angular-docker-image-and-push-to-docker-hub-demo.git'
            }
        }
        stage('Build Docker Image') {
   			 steps {
       			 //bat 'docker build -t charleshoanduong1111/angular-docker-image:$BUILD_NUMBER .'
       			 bat 'docker build -t charleshoanduong1111/jenkins:build . ' 
  		 	 }
		}
    }
}
pipeline {
	environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub_id')}
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
		stage('Login to Docker Hub') {
    		steps {
        		//bat 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin'
        		//bat 'echo @CHChdChd11 | docker login -u charleshoanduong1111 --password-stdin'
        		//bat 'docker login -u="${DOCKER_USERNAME}" -p="${DOCKER_PASSWORD}"'
        		bat 'docker login -u=charleshoanduong1111 -p=@CHChdChd11'
    		}
		}
    }
}
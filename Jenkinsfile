pipeline {
	environment {
    DOCKERHUB_CREDENTIALS = credentials('charleshoanduong1111-github-app')}
    agent any
    stages {
        stage('SCM Checkout') {
            steps {
                git branch: 'main', credentialsId: 'charleshoanduong1111-github-app', url: 'https://github.com/JenkinsCiCdDemo/jenkins-pipeline-to-create-angular-docker-image-and-push-to-docker-hub-demo.git'
            }
        }
        stage('Build Docker Image') {
   			 steps {
       			 //sh 'docker build -t charleshoanduong1111/angular-docker-image:$BUILD_NUMBER .'
       			 bat 'docker build -t charleshoanduong1111/jenkins:build . ' //OK
       			 //bat 'docker build -t charleshoanduong1111/jenkins:%BUILD_NUMBER% . ' ok       			 
  		 	 }
		}
		stage('Login to Docker Hub') {
    		steps {
				bat 'echo DOCKERHUB_CREDENTIALS_USR = %DOCKERHUB_CREDENTIALS_USR% '
        		bat 'echo DOCKERHUB_CREDENTIALS = %DOCKERHUB_CREDENTIALS% '
        		bat 'echo DOCKERHUB_CREDENTIALS_PSW = %DOCKERHUB_CREDENTIALS_PSW%'
        		//sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
        		//sh 'echo ${DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin'
        		//bat 'docker login -u=charleshoanduong1111 -p=@CHChd*211'  //OK
        		bat 'docker login -u=%DOCKERHUB_CREDENTIALS_USR%  -p=%DOCKERHUB_CREDENTIALS_PSW%'  //OK      		
    		}
    	stage('Push Image') {
    		steps {					
       			//sh 'docker push **devopscloudbootcamp**/webapp:$BUILD_NUMBER'
        		bat 'docker push charleshoanduong1111/jenkins:build'
   			}
		}
    }
}
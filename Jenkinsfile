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
        stage('Clean up') {
   			 steps {
				
       			 //Remove old and unused Docker images from Docker
       			 bat 'docker image prune --all --force'
       			 
       			 //Remove the existing container from Docker Hub
		      	 //bat 'docker stop charleshoanduong1111-job && docker rm -f charleshoanduong1111-job'
       			 
  		 	 }
		}        
        stage('Build Docker Image by Dockerfile') {
   			 steps {

       			 bat 'docker build -t charleshoanduong1111/jenkins:build_%BUILD_NUMBER% .'
       			 
  		 	 }
		}
		stage('Login to Docker Hub') {
    		steps {
				
				bat 'echo DOCKERHUB_CREDENTIALS = %DOCKERHUB_CREDENTIALS% '
				bat 'echo DOCKERHUB_CREDENTIALS_USR = %DOCKERHUB_CREDENTIALS_USR% '
        		bat 'echo DOCKERHUB_CREDENTIALS_PSW = %DOCKERHUB_CREDENTIALS_PSW%'
        		
        		bat 'docker login -u=%DOCKERHUB_CREDENTIALS_USR%  -p=%DOCKERHUB_CREDENTIALS_PSW%'  //OK        		
    		}
		}
		stage('Push Image from Docker to Docker Hub for sharing to world users') {
    		steps {					

        		bat 'docker push charleshoanduong1111/jenkins:build_%BUILD_NUMBER%'  
   			}
		}	
		stage('Deploy Application | Push Image from Docker to Docker Hub for sharing to world users') {
    		steps {					

        		bat 'docker push charleshoanduong1111/jenkins:build_%BUILD_NUMBER%'  
   			}
		}
		stage('Run Angular App by running docker image') {
    		steps {					

        	    bat 'docker run -d -p 4200:4200 --name charleshoanduong1111-job charleshoanduong1111/jenkins:build_%BUILD_NUMBER%'

   			}
		}
		stage('**Deploy Application**') {
   			 steps{
		       bat 'echo TODO Deploy Application'
		       
		       // # remove the existing container
		       //bat 'docker stop charleshoanduong1111-job && docker rm -f charleshoanduong1111-job'
		       
		       //# create and run a new container
		       //bat 'docker run -p 4200:4200 --name charleshoanduong1111-job charleshoanduong1111/jenkins:build_%BUILD_NUMBER%'
		       //Ready! Next, we will access the URL http://localhost:4200/ 
		       //and check if the application is working inside the Docker container.
		       
		       //TODO - ERROR
		       //# create and run a new container
		       //According to tutorial I read so far, use "docker run -d" will start a container from image, 
		       //and the container will run in background.		       
		       //TODO
			   //C:\ProgramData\Jenkins\.jenkins\workspace\2 push docker image wiht pipline script from scm with github jenkinsfile>
			   //docker run -d 4200:4200 --name charleshoanduong1111-job charleshoanduong1111/jenkins:build_58 
			   //Unable to find image '4200:4200' locally
			   //docker: Error response from daemon: pull access denied for 4200, repository does not exist or may require 'docker login': denied: requested access to the resource is denied.
		       //bat 'docker run -d 4200:4200 --name charleshoanduong1111-job charleshoanduong1111/jenkins:build_%BUILD_NUMBER%'
		       //Ready! Next, we will access the URL http://localhost:4200/ 
		       //and check if the application is working inside the Docker container.

		     }
		}
		
    }
}
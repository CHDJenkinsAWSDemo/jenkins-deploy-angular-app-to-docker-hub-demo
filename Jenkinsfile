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
		stage('Run Angular App | Start a container from a docker image') {
    		steps {					
        	    
        	    //Run container from image online 
        	    //bat 'docker run -p 4200:4200 --name charleshoanduong1111-job charleshoanduong1111/jenkins:build_%BUILD_NUMBER%'

		        //Use "docker run -d" will start a container from image, and the container will run in background
        	    bat 'docker run -d -p 4200:4200 --name charleshoanduong1111-job charleshoanduong1111/jenkins:build_%BUILD_NUMBER%'
        	    //Ready! Next, test by accessing the URL http://localhost:4200/ 
   			}
		}
		stage('Remove the generated container from Docker Hub after 5 minus') {
    		steps {			

  				echo 'Waiting 5 minutes for running angular app, then delete the container'
  				sleep 300 // seconds	
     
		      	bat 'docker stop charleshoanduong1111-job && docker rm -f charleshoanduong1111-job'

   			}
		}		
		
    }
}
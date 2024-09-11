pipeline {
	environment {
    DOCKERHUB_CREDENTIALS = credentials('charleshoanduong1111-github-app')}
    agent any

    stages {
        stage('SCM Checkout') {
            steps {
                git branch: 'main', credentialsId: 'charleshoanduong1111-github-app', url: 'https://github.com/JenkinsCiCdDemo/jenkins-deploy-angular-app.git'
            }
        }
        stage('Clean up old and unused Docker images') {
   			 steps {
				
				 //To delete a specific image.
				 //docker rmi <image_id>: 
				
				 //Docker provides a single command that will clean up any resources — images, containers, volumes, and networks — 
				 //that are dangling (not tagged or associated with a container)
				 //docker system prune -a -f
				
       			 //Remove old and unused Docker images from Docker
       			 sh 'docker image prune --all --force'            			 
       			 
  		 	 }
		}        
        stage('Build Docker Image by Dockerfile') {
   			 steps {

       			 sh 'docker build -t charleshoanduong1111/jenkins:build_$BUILD_NUMBER .'
       			 
  		 	 }
		}
		stage('Login to Docker Hub') {
    		steps {

				sh 'echo DOCKERHUB_CREDENTIALS = $DOCKERHUB_CREDENTIALS '
				sh 'echo DOCKERHUB_CREDENTIALS_USR = $DOCKERHUB_CREDENTIALS_USR '
        		sh 'echo DOCKERHUB_CREDENTIALS_PSW = $DOCKERHUB_CREDENTIALS_PSW'
        		
        		sh 'docker login -u=$DOCKERHUB_CREDENTIALS_USR  -p=$DOCKERHUB_CREDENTIALS_PSW'          		
    		}
		}
		stage('Push Image from Docker to Docker Hub for sharing to world users') {
    		steps {					

        		sh 'docker push charleshoanduong1111/jenkins:build_$BUILD_NUMBER'  
   			}
		}	
		stage('Deploy Application | Push Image from Docker to Docker Hub for sharing to world users') {
    		steps {					

        		sh 'docker push charleshoanduong1111/jenkins:build_$BUILD_NUMBER'  
   			}
		}
		stage('Run Angular App | Start a container from a docker image') {
    		steps {					
        	    
        	    //Run container from image online 
        	    //sh 'docker run -p 4200:4200 --name chdjob_$BUILD_NUMBER charleshoanduong1111/jenkins:build_%BUILD_NUMBER%'

		        //Use "docker run -d" will start a container from image, and the container will run in background
        	    sh 'docker run -d -p 4200:4200 --name chdjob_$BUILD_NUMBER charleshoanduong1111/jenkins:build_%BUILD_NUMBER%'
        	    //Ready! Next, test by accessing the URL http://localhost:4200/ 
   			}
		}
		stage('Remove the generated container from Docker Hub after 5 minus') {
    		steps {			

  				echo 'Waiting 5 minutes for running angular app, then delete the container'
  				sleep 300 // seconds	
     
		      	sh 'docker stop chdjob_$BUILD_NUMBER && docker rm -f chdjob_$BUILD_NUMBER'

   			}
		}		
		
    }
}
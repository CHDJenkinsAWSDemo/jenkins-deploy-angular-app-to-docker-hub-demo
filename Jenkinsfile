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
       			 //bat 'docker build -t charleshoanduong1111/angular-docker-image:$BUILD_NUMBER .'
       			 //bat 'docker build -t charleshoanduong1111/jenkins:build . ' 
       			 bat 'docker build -t charleshoanduong1111/jenkins:build_%BUILD_NUMBER% .'
       			 
  		 	 }
		}
		stage('Login to Docker Hub') {
    		steps {
				bat 'echo DOCKERHUB_CREDENTIALS_USR = %DOCKERHUB_CREDENTIALS_USR% '
        		bat 'echo DOCKERHUB_CREDENTIALS = %DOCKERHUB_CREDENTIALS% '
        		bat 'echo DOCKERHUB_CREDENTIALS_PSW = %DOCKERHUB_CREDENTIALS_PSW%'
        		//bat 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin'
        		//bat 'echo @CHChdChd11 | docker login -u charleshoanduong1111 --password-stdin'
        		//bat 'docker login -u="${DOCKER_USERNAME}" -p="${DOCKER_PASSWORD}"'
        		//bat 'docker login -u=charleshoanduong1111 -p=@CHChdChd11'  //OK
        		//bat 'docker login -u=charleshoanduong1111 -p=@CHChdChd11'  //OK
        		bat 'docker login -u=%DOCKERHUB_CREDENTIALS_USR%  -p=%DOCKERHUB_CREDENTIALS_PSW%'  //OK        		
    		}
		}
		stage('Push Image') {
    		steps {					
       			//sh 'docker push **devopscloudbootcamp**/webapp:$BUILD_NUMBER'
        		bat 'docker push charleshoanduong1111/jenkins:build_%BUILD_NUMBER%'  //OK
   			}
		}	
		stage('**Deploy Application**') {
   			 steps{
		       bat 'echo TODO Deploy Application'
		       
		       // # remove the existing container
		       bat 'docker stop charleshoanduong1111-job && docker rm -f charleshoanduong1111-job'
		       
		       //# create and run a new container
		       //bat 'docker run -p 4200:4200 --name charleshoanduong1111-job charleshoanduong1111/jenkins:build_%BUILD_NUMBER%'
		       //Ready! Next, we will access the URL http://localhost:4200/ 
		       //and check if the application is working inside the Docker container.
		       
		       //# create and run a new container
		       //According to tutorial I read so far, use "docker run -d" will start a container from image, 
		       //and the container will run in background.
		       bat 'docker run -d 4200:4200 --name charleshoanduong1111-job charleshoanduong1111/jenkins:build_%BUILD_NUMBER%'
		       //Ready! Next, we will access the URL http://localhost:4200/ 
		       //and check if the application is working inside the Docker container.

		     }
		}
		stage('**Remove Docker image from Docker**') {
   			 steps{
				//bat 'docker rmi $(docker images -q charleshoanduong1111/jenkins:*)'
				//bat 'docker rmi %docker images -q charleshoanduong1111/jenkins:*%'
				//bat "docker rmi -f $(docker images -f=reference='<image_name>:<tag_name>*'"
				//bat "docker rmi $(docker images --filter=reference="nexus*/*/*:6.6.1-feature_1*" -q) -f"
				bat 'echo Remove Docker image from Docker'
				//TODO
				//bat 'docker rmi $(docker images -filter=reference="charleshoanduong1111/jenkins:build*" -q) -f'
		     }
		}		
		
    }
}
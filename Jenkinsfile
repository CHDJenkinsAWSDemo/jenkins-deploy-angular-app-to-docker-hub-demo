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
       			 bat 'docker build -t charleshoanduong1111/jenkins:build . ' 
       			 
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
        		bat 'docker push charleshoanduong1111/jenkins:build'  //OK
   			}
		}	
		stage('**Deploy Application**') {
   			 steps{
 		       // '''
 		       //cker stop webapp_ctr
 		       //cker run --rm -d -p 3000:3000 --name webapp_ctr **devopscloudbootcamp**/webapp:${BUILD_NUMBER}
		       //''
		       
		       //TODO
 		       //bat '''
  		       //docker stop webapp_ctr
 		       //docker run --rm -d -p 4200:4200 -name webapp_ctr charleshoanduong1111/jenkins:build
		       // '''		   
		       bat 'echo TODO Deploy Application'
		       bat 'docker stop $(docker ps -a -q)' // Stop all running containers: docker stop $(docker ps -a -q)
		       bat 'docker rm $(docker ps -a -q)' // Delete all stopped containers: docker rm $(docker ps -a -q)
		     }
		}
		stage('**Remove Docker image from Docker**') {
   			 steps{
				//bat 'docker rmi $(docker images -q charleshoanduong1111/jenkins:*)'
				//bat 'docker rmi %docker images -q charleshoanduong1111/jenkins:*%'
				//bat "docker rmi -f $(docker images -f=reference='<image_name>:<tag_name>*'"
				//bat "docker rmi $(docker images --filter=reference="nexus*/*/*:6.6.1-feature_1*" -q) -f"
				bat 'echo Remove Docker image from Dockern'
				//TODO
				//bat 'docker rmi $(docker images -filter=reference="charleshoanduong1111/jenkins:build*" -q) -f'
		     }
		}		
		
    }
}
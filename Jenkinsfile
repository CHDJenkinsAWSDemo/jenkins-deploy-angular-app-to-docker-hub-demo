pipeline {
	environment {
	registry = "charleshoanduong1111/angular-docker-image"
	registryCredential = 'dockerhub_id'
	dockerImage = ''
	}
	agent any
	stages {
		stage('Cloning our Git') {
			steps {
			git 'https://github.com/JenkinsCiCdDemo/jenkins-pipeline-to-create-angular-docker-image-and-push-to-docker-hub-demo.git'
			}
		}
		stage('Building our image') {
			steps{
				script {
					dockerImage = docker.build registry + ":$BUILD_NUMBER"
				}
			}
		}
		stage('Deploy our image') {
			steps{
				script {
					docker.withRegistry( '', registryCredential ) {
					dockerImage.push()
					}
				}
			}
		}
		stage('Cleaning up') {
			steps{
				sh "docker rmi $registry:$BUILD_NUMBER"
			}
		}
	}
}
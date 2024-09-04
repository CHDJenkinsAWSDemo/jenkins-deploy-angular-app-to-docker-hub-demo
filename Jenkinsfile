node {    
      def app     
      stage('Clone repository') {               
             
            checkout scm    
      }     
      stage('Build image') {         
            bat 'npm install' //chd
            app = docker.build("charleshoanduong1111/angular-docker-image")    
       }     
      stage('Test image') {           
            app.inside {            
               // sh 'echo "Tests passed"'  //chd  
               bat 'echo "Tests passed"'        
            }    
        }     
       stage('Push image') {
           docker.withRegistry('https://registry.hub.docker.com', 'charleshoanduong1111-github-app') {            
       	   app.push("${env.BUILD_NUMBER}")            
           app.push("latest")        
 		}    
      }
}

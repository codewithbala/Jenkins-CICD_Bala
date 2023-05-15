pipeline {
	agent any
	tools {
    	maven 'myMaven'
	}
	stages {
    	stage("Checkout") {   
        	steps {               	 
            	git branch: 'pipeline1', url: 'https://github.com/codewithbala/Jenkins-CICD_Bala.git'        	 
           	 
        	}    
    	}
    	stage('Maven Clean') {
        	steps {
        	sh "mvn clean"  	 
        	}
    	}
    	stage('Maven Build') {
        	steps {
        	sh "mvn compile"  	 
        	}
    	}
   	 
    	stage("Unit test") {          	 
        	steps {  	 
            	sh "mvn test"          	 
       	}
}
}
}

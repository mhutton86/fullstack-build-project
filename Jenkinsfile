pipeline {
	agent any
	options {
		withAWS(credentials:'aws-jenkins',region:'us-west-2')
	}
	stages {
// 		stage('Lint HTML') {
// 			steps {
// 				sh 'tidy -q -e *.html'
// 			}
// 		}
		stage('Build, run, provision the Docker environment') {
			steps {
				sh 'make fresh-start'
			}
		}
		stage('Upload to AWS') {
			steps {
				s3Upload(file:'index.html', bucket:'udacity-devops-jenkins-static')
			}
		}
	}
}

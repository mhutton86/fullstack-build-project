pipeline {
	agent any
	options {
		withAWS(credentials:'aws-static',region:'us-west-2')
	}
	stages {
		stage('Lint HTML') {
			steps {
				sh 'tidy -q -e *.html'
			}
		}
		stage('Upload to AWS') {
			steps {
				s3Upload(file:'index.html', bucket:'udacity-devops-jenkins-static')
			}
		}
	}
}

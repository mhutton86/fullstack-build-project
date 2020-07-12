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
		stage('Build, run, provision Docker environment') {
			steps {
				sh 'make fresh-start'
			}
		}
		stage('Deploy container to registry') {
			steps {
				// Docker Push Step 1: Authenticate
				// If you run into the error: "Error saving credentials: error storing credentials - err: exit status 1, out: Cannot autolaunch D-Bus without X11 $DISPLAY"
				// Perform the following on the jenkins server: sudo apt install pass gnupg2
				// Reference: https://anto.online/guides/cannot-autolaunch-d-bus-without-x11-display/
				withDockerRegistry(url: "https://docker.pkg.github.com", credentialsId:"github-mhutton86") {
// 					steps {
						// Docker Push Step 2: Tag
						// EG: docker tag IMAGE_ID docker.pkg.github.com/mhutton86/repository-name/IMAGE_NAME:VERSION
						sh 'make push-docker-app'
// 					}
				}
			}
		}
// 		stage('Upload to AWS') {
// 			steps {
// 				s3Upload(file:'index.html', bucket:'udacity-devops-jenkins-static')
// 			}
// 		}
	}
}

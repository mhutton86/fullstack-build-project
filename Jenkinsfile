pipeline {
	agent any
	options {
		withAWS(credentials:'aws-jenkins',region:'us-west-2')
		buildDiscarder(
			logRotator(
			  artifactDaysToKeepStr: '',
			  artifactNumToKeepStr: '',
			  daysToKeepStr: '60',
			  numToKeepStr: '10',
			)
		)
	}
	stages {
		stage('Lint App') {
			steps {
				sh 'make lint-app'
			}
		}
		stage('Build, run, provision Docker environment') {
			steps {
				script {
					try {
						sh 'make fresh-start'
					} finally {
						sh 'make stop-docker-env'
					}
				}
			}
		}
// 		stage('Application Test') {
// 			steps {
// 				script {
// 					try {
// 						sh 'make test-docker-env'
// 					} finally {
// 						sh 'make stop-docker-env'
// 					}
// 				}
// 			}
// 		}
		stage('Deploy container to registry') {
			steps {
				// Docker Push Step 1: Authenticate
				// If you run into the error: "Error saving credentials: error storing credentials - err: exit status 1, out: Cannot autolaunch D-Bus without X11 $DISPLAY"
				// Perform the following on the jenkins server: sudo apt install pass gnupg2
				// Reference: https://anto.online/guides/cannot-autolaunch-d-bus-without-x11-display/
				withDockerRegistry(url: "https://docker.pkg.github.com", credentialsId:"github-mhutton86") {
					// Docker Push Step 2: Tag
					// EG: docker tag IMAGE_ID docker.pkg.github.com/mhutton86/repository-name/IMAGE_NAME:VERSION
					sh 'make push-docker-app'
				}
			}
		}
		stage('Update Kubernetes cluster w/ latest build') {
			steps {
				sh '''
				export $KUBECONFIG
				echo $KUBECONFIG
				cat $KUBECONFIG
				kubectl config --current-context
				make update-k8-cluster
				'''
			}
		}
	}
}

pipeline {
	agent any
	options {
		withAWS(credentials:'aws-jenkins',region:'us-west-2')
		withDockerRegistry(url: "https://docker.pkg.github.com", credentialsId:"github-mhutton86")
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
				// EG: cat ~/GH_TOKEN.txt | docker login docker.pkg.github.com -u mhutton86 --password-stdin
// 				withDockerRegistry(url: "https://docker.pkg.github.com", credentialsId:"github-mhutton86") {
// 					steps {
						// Docker Push Step 2: Tag
						// EG: docker tag IMAGE_ID docker.pkg.github.com/mhutton86/repository-name/IMAGE_NAME:VERSION
						sh 'make push-docker-app'
// 					}
// 				}
			}
		}
// 		stage('Upload to AWS') {
// 			steps {
// 				s3Upload(file:'index.html', bucket:'udacity-devops-jenkins-static')
// 			}
// 		}
	}
}

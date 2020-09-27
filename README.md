# A CI/CD Project for a Rails + Sidekiq + PostGres application.
The "Udacity: Cloud DevOps Engineer" Capstone Project.

# Description

# Prerequisites
- [eksctl](https://eksctl.io/introduction/#installation)

# Workflows
## Development (Docker)
### First-time Setup
1. Build and run the docker image. Can be called subsequently.
    - `make run-docker-dev-env`
    - _Note: You may require calling this with a sudo. Docker Compose doesn't always run with the same privelidges that Docker does._
1. Provision development data. This only needs to be run once against a fresh environment.
    - `./scripts/docker-provision-dev-env.sh`

### Reset development environment and data
1. Tear down the development environment and scrub the data. This should, NEVER, be run against production.
    - `./scripts/docker-reset-dev-env.sh`

## Production
1. TODO

## Install prerequisites
### Application
- Make
- Docker 19.x
- Docker Compose 1.26.x
- `kubectl` v1.17.x 
- `eksctl` v0.27.x
- Ruby 2.7.x
- Rails 5.2.x
- libpg-dev

### Jenkins
#### Configuration
- Set up AWS credentials (id: `aws-jenkins`)
- Set up Docker credentials (id: `github-mhutton86`)
- Set up Kubeconfig credentials

#### Plugins
- Blue Ocean
- CloudBees Docker Build and Publish plugin
- Kubernetes Continuous Deploy Plugin
- Pipeline: AWS Steps

#### Server
- Docker
- Docker Compose
- Make
- pass 
- gnupg2
- awscli (configuration at ~jenkins/.aws/config & ~jenkins/.aws/credentials)
- kubectl (configuration at ~jenkins/.kube/config, ID: kubeconfig)

# References
1. This article was used for creating Rails, Sidekiq, and Postgres environment on docker 
    1. https://dev.to/raphael_jambalos/more-than-hello-world-in-docker-run-rails-sidekiq-web-apps-in-docker-1b37
2. Emphasis was placed on making a "Twelve Factor App"
    1. https://12factor.net/
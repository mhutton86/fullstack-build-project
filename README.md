# A CI/CD Project for a Rails + Sidekiq + PostGres application.
The "Udacity: Cloud DevOps Engineer" Capstone Project.

# Description

# TODO
- TODO DELETEME

# Workflows
## Development (Docker)
### First-time Setup
1. Build and run the docker image. Can be called subsequently.
    - `./scripts/run-docker-dev-env.sh`
    - _Note: You may require calling this with a sudo. Docker Compose doesn't always run with the same privelidges that Docker does._
1. Provision development data. This only needs to be run once against a fresh environment.
    - `./scripts/provision-docker-dev-env.sh`

### Reset development environment and data
1. Tear down the development environment and scrub the data. This should, NEVER, be run against production.
    - `./scripts/reset-docker-dev-env.sh`

## Production
1. TODO

## Install prerequisites
- Docker 19.x
- Docker Compose 1.26.x
- Ruby 2.7.x
- Rails 5.2.x
- libpg-dev

# References
1. This article was used for creating Rails, Sidekiq, and Postgres environment on docker 
    1. https://dev.to/raphael_jambalos/more-than-hello-world-in-docker-run-rails-sidekiq-web-apps-in-docker-1b37
2. Emphasis was placed on making a "Twelve Factor App"
    1. https://12factor.net/
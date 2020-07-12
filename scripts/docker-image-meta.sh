#!/bin/bash
# This script is for defining the docker image meta

# docker image meta
DOCKER_IMAGE_NAME=mhutton86/rails-sidekiq-like-webapp
DOCKER_IMAGE_VERSION=1.0.0

# docker repo meta
DOCKER_REPO_URL=docker.pkg.github.com
DOCKER_REPO_USER=docker.pkg.github.com
DOCKER_REPO_NAME=fullstack-build-project

# Print the info
echo "Setting DOCKER_IMAGE_NAME='${DOCKER_IMAGE_NAME}'
DOCKER_IMAGE_VERSION='${DOCKER_IMAGE_VERSION}'"
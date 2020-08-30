#!/bin/bash -xe
# This script is for defining the docker image meta

# docker image meta
DOCKER_IMAGE_NAME=rails-sidekiq-like-webapp
DOCKER_IMAGE_VERSION=1.0.0

# docker repo meta
DOCKER_REPO_URL=docker.pkg.github.com
DOCKER_REPO_USER=mhutton86
DOCKER_REPO_NAME=fullstack-build-project

# Print the info
echo "Setting
  DOCKER_IMAGE_NAME='${DOCKER_IMAGE_NAME}'
  DOCKER_IMAGE_VERSION='${DOCKER_IMAGE_VERSION}'
  DOCKER_REPO_URL='${DOCKER_REPO_URL}'
  DOCKER_REPO_USER='${DOCKER_REPO_USER}'
  DOCKER_REPO_NAME='${DOCKER_REPO_NAME}'
"
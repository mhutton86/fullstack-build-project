#!/bin/bash -xe
# This script is for defining the docker image meta

# Get script's directory.
# "It will work as long as the last component of the path used to find the script is not a
# symlink (directory links are OK)"
# Ref: https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Load our K8 environment variables
echo "loading base environment variables"
# shellcheck source=./.env
source "${SCRIPT_DIR}/../../.env"

# docker image meta
DOCKER_IMAGE_NAME=rails-sidekiq-like-webapp
DOCKER_IMAGE_VERSION=${RAILS_APP_CONTAINER_VERSION}

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
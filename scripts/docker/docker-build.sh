#!/bin/bash -xe
# This script is for building the docker image

# Get script's directory.
# "It will work as long as the last component of the path used to find the script is not a
# symlink (directory links are OK)"
# Ref: https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Source the docker image info
# shellcheck source=./.docker-base.sh
. "${DIR}/.docker-base.sh"

# Step 1:
# Build image and add a descriptive tag
docker build --tag="${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}" "${DIR}/../../"

# Step 2:
# List docker images
docker image ls

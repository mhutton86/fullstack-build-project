#!/bin/bash -xe
# This script is for provisioning a fresh development environment

# Get script's directory.
# "It will work as long as the last component of the path used to find the script is not a
# symlink (directory links are OK)"
# Ref: https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Navigate to development docker environment directory
cd "${DIR}/../docker/development" || exit

# Create and populate the database
docker-compose run web rake db:create
docker-compose run web rake db:migrate
docker-compose run web rake db:seed
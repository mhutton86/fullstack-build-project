#!/bin/bash
# This script is for resetting a development environment of the rails application

# Get script's directory.
# "It will work as long as the last component of the path used to find the script is not a
# symlink (directory links are OK)"
# Ref: https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Navigate to development docker environment directory
cd "${DIR}/../docker/development" || exit

# Tear down the docker compose environment
docker-compose down

# Delete the database. Use sudo, as it keeps being created as owned by root.
sudo rm -rf "${DIR}/../tmp/db"
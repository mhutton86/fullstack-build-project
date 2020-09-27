#!/bin/bash -e
# This script is for provisioning Rails

# Get script's directory.
# "It will work as long as the last component of the path used to find the script is not a
# symlink (directory links are OK)"
# Ref: https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# navigate to app directory
cd "$DIR/../"

# Create, migrate, and populate the database
rake db:create
rake db:migrate
rake db:seed
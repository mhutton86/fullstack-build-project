#!/bin/bash -e
# This script is for applying the Kubernetes environment configuration.

# Get script's directory.
# "It will work as long as the last component of the path used to find the script is not a
# symlink (directory links are OK)"
# Ref: https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Load our K8 environment variables
echo "loading K8 environment variables"
# shellcheck source=./.env
source "${SCRIPT_DIR}/../../.env"
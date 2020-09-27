#!/bin/bash
# This script is for deleting the Kubernetes environment configuration.

# Get script's directory.
# "It will work as long as the last component of the path used to find the script is not a
# symlink (directory links are OK)"
# Ref: https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Load our K8 base scripts
echo "Loading the K8 base script"
# shellcheck source=./.k8-base.sh
source "${SCRIPT_DIR}/.k8-base.sh"

echo "Deleting the kubernetes configurations"
for file in "${SCRIPT_DIR}/../../docker/kubernetes"/*
do
  envsubst < "$file" | kubectl delete -f - --force --wait=false
done


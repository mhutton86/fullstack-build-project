#!/bin/bash -xe
# This script is for updating an Elastic Kubernetes Service (EKS) cluster

# Get script's directory.
# "It will work as long as the last component of the path used to find the script is not a
# symlink (directory links are OK)"
# Ref: https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Update the EKS cluster via configuration file
eksctl upgrade cluster -f "${DIR}/../../infrastructure/eks/eksctl-cluster.yaml"

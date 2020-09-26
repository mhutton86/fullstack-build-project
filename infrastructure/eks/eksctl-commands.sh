#!/bin/bash -xe
CLUSTER_NAME=cluster-1
AWS_REGION=us-west-2
NUMBER_NODES=4
NODE_VOLUME_SIZE_GB=50
ENVIRONMENT=development

# Get all clusters
eksctl get cluster

# Create a cluster via parameters
eksctl create cluster \
  --name=${CLUSTER_NAME} \
  --region=${AWS_REGION} \
  --ssh-access \
  --nodes=${NUMBER_NODES} \
  --node-volume-size=${NODE_VOLUME_SIZE_GB} \
  --tags environment=${ENVIRONMENT}

# Create a cluster via configuration file
eksctl create cluster -f infrastructure/eks/eksctl-cluster.yaml

# See cluster contents
kubectl get nodes

# Delete a cluster (by name)
eksctl delete cluster \
  --name=${CLUSTER_NAME} \
  --region=${AWS_REGION}

# Delete a cluster (by configuration)
eksctl delete cluster -f infrastructure/eks/eksctl-cluster.yaml

# View/Edit the Kube config
vim /home/ubuntu/.kube/config

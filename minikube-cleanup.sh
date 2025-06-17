#!/bin/bash

# Minikube Cleanup Script

echo "Stopping minikube..."
minikube stop

echo "Deleting minikube cluster..."
minikube delete --all --purge

echo "Removing dangling Docker containers and images..."
docker container prune -f
docker image prune -f

echo "Removing minikube Docker containers..."
docker rm -f $(docker ps -a -q --filter "name=minikube") 2>/dev/null

echo "Removing ~/.minikube and ~/.kube folders..."
rm -rf ~/.minikube
rm -rf ~/.kube

echo "Minikube cleanup complete!"

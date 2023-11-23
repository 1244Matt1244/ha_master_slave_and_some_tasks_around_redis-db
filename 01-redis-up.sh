#!/bin/bash

# Create Redis namespace
kubectl create namespace redis

# Deploy Redis master
kubectl apply -f redis-master-deployment.yaml -n redis

# Deploy Redis slave
kubectl apply -f redis-slave-deployment.yaml -n redis

# Expose Redis master service
kubectl expose deployment redis-master --name=redis-master-service --type=NodePort --port=6379 --target-port=6379 -n redis

# Expose Redis slave service
kubectl expose deployment redis-slave --name=redis-slave-service --type=NodePort --port=6379 --target-port=6379 -n redis

REDIS_SLAVE_PORT=$(kubectl -n redis get service redis-slave-service -o jsonpath='{.spec.ports[0].nodePort}')

# Set environment variables for the master and slave
echo "export REDIS_MASTER_HOST_PORT=$(minikube ip):$REDIS_MASTER_PORT" >> _dev_vars.sh
echo "export REDIS_SLAVE_HOST_PORT=$(minikube ip):$REDIS_SLAVE_PORT" >> _dev_vars.sh
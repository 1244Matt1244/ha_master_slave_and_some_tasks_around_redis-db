#!/bin/bash

# Script to set environment variables for Redis host and port

export REDIS_MASTER_HOST_PORT=$(minikube ip):32400
export REDIS_SLAVE_HOST_PORT=$(minikube ip):32401

echo "REDIS_MASTER_HOST_PORT=$REDIS_MASTER_HOST_PORT"
echo "REDIS_SLAVE_HOST_PORT=$REDIS_SLAVE_HOST_PORT"



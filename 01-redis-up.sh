#!/bin/bash

echo "Deploying Redis Master..."
kubectl apply -f redis-master.yaml

if [ $? -ne 0 ];then
    echo "Error: Failed to deploy Redis Master" >&2
    exit 1
fi

echo "Deploying Redis Slave..."
kubectl apply -f redis-slave.yaml

if [ $? -ne 0 ];then
    echo "Error: Failed to deploy Redis Slave" >&2
    exit 1
fi

echo "Deploying Redis Sentinel (Optional)..."
kubectl apply -f redis-sentinel.yaml

if [ $? -ne 0 ];then
    echo "Error: Failed to deploy Redis Sentinel" >&2
    exit 1
fi

echo "Redis Master-Slave-Sentinel setup complete!"

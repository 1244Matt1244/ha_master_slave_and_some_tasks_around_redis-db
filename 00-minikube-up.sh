#!/bin/bash

echo "Starting Minikube..."
minikube start --cpus=4 --memory=4096 --disk-size=20g

if [ $? -ne 0 ]; then
    echo "Error: Minikube failed to start." >&2
    exit 1
fi

echo "Minikube started successfully!"

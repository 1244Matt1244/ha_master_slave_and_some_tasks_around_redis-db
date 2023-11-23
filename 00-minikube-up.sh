#!/bin/bash

# Start Minikube with 2 nodes
minikube start --nodes 2

# Enable Ingress controller
minikube addons enable ingress

# Wait for Minikube to be ready
kubectl wait --for=condition=Ready node -l '!node-role.kubernetes.io/master' --timeout=300s
#!/bin/bash

# Start Minikube with 2 nodes
minikube start --nodes 2

# Enable Ingress controller
minikube addons enable ingress

# Wait for Minikube to be ready
kubectl wait --for=condition=Ready node -l '!node-role.kubernetes.io/master' --timeout=300s


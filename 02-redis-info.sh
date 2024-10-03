#!/bin/bash

echo "Retrieving Redis Info..."

kubectl exec -it $(kubectl get pods -l app=redis-master -o jsonpath='{.items[0].metadata.name}') -- redis-cli INFO

if [ $? -ne 0 ]; then
    echo "Error: Unable to retrieve Redis info." >&2
    exit 1
fi

echo "Redis info retrieved successfully!"

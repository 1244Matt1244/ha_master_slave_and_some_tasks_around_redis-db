#!/bin/bash

# Script to import data into Redis

REDIS_CLI="redis-cli"
DATA_FILE="import/redis/data.txt"

# Check if data file exists
if [ ! -f "$DATA_FILE" ]; then
  echo "Data file not found: $DATA_FILE"
  exit 1
fi

# Import data into Redis
$REDIS_CLI -h $REDIS_MASTER_HOST_PORT -p 6379 < $DATA_FILE

echo "Data imported into Redis successfully!"


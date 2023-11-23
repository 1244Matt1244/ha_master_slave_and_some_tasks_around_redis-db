#!/bin/bash

# Script to delete all data from Redis

REDIS_CLI="redis-cli"

# Delete all data from Redis
$REDIS_CLI -h $REDIS_MASTER_HOST_PORT -p 6379 FLUSHALL

echo "Redis data cleaned successfully!"




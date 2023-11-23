#!/bin/bash

# Stop the recurring Redis INFO replication task
killall 02-redis-info.sh

# Delete the CronJob and ConfigMap
kubectl delete cronjob redis-info-cronjob -n redis
kubectl delete configmap redis-info-script -n redis

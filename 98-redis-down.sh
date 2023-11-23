# Delete Redis master and slave services
kubectl delete service redis-master-service --namespace=redis
kubectl delete service redis-slave-service --namespace=redis

# Delete Redis master and slave deployments
kubectl delete deployment redis-master --namespace=redis
kubectl delete deployment redis-slave --namespace=redis

# Delete Redis namespace
kubectl delete namespace redis



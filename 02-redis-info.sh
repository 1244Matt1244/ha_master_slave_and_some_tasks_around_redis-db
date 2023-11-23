# Create a ConfigMap for the script
kubectl create configmap redis-info-script --from-file=redis-info.sh

# Create a CronJob to run the script every minute
kubectl apply -f redis-info-cronjob.yaml


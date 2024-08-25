# HA-master-slave-and-some-tasks-around-Redis-DB

**Repository Owner:** 1244Matt1244  
**Repository Name:** ha_master_slave_and_some_tasks_around_redis-db  
**Repository URL:** https://github.com/1244Matt1244/ha_master_slave_and_some_tasks_around_redis-db

### Repository Overview

The repository `ha_master_slave_and_some_tasks_around_redis-db` is a public GitHub repository aimed at providing scripts and resources for setting up a local Kubernetes environment with Redis for development purposes. It includes various shell scripts and Kubernetes configuration files to facilitate the deployment and management of Redis master-slave configurations.

### Key Components

1. **Shell Scripts:**  
   - `00-minikube-up.sh`: Script to start Minikube.
   - `01-redis-up.sh`: Script to set up Redis.
   - `02-redis-info.sh`: Script to get Redis info.
   - `97-redis-info-down.sh`: Script to tear down Redis info.
   - `98-redis-down.sh`: Script to tear down Redis.
   - `99-minikube-down.sh`: Script to stop Minikube.
   - `_dev_vars.sh`: Development variables.
   - `_init_variables.sh`: Initialize variables.
   - `redisClean.sh`: Clean Redis.
   - `redisImport.sh`: Import data into Redis.

2. **Kubernetes Configuration Files:**  
   - `redis-master.yaml`: Configuration for Redis master.
   - `redis-master-deployment.yaml`: Deployment configuration for Redis master.
   - `redis-master-statefulset.yaml`: StatefulSet configuration for Redis master.
   - `redis-master-pv.yaml`: Persistent volume configuration for Redis master.
   - `redis-master-crd.yaml`: Custom Resource Definition for Redis master.
   - `redis-slave.yaml`: Configuration for Redis slave.
   - `redis-slave-deployment.yaml`: Deployment configuration for Redis slave.
   - `redis-slave-statefulset.yaml`: StatefulSet configuration for Redis slave.
   - `redis-slave-crd.yaml`: Custom Resource Definition for Redis slave.
   - `redis-info-task.yaml`: Task configuration for Redis info.
   - `redis-info-cronjob.yaml`: Cron job configuration for Redis info.
   - `redis-namespace.yaml`: Namespace configuration for Redis.

3. **Other Files:**  
   - `.gitignore`: File to specify intentionally untracked files to ignore.
   - `LICENSE`: BSD-2-Clause license file.
   - `README.md`: Markdown file providing repository documentation.
   - `data.txt`: Text file containing data.
   - `launch.json`: Configuration file for launching tasks.
   - `markdown.md`: Markdown file.
   - `readme.md`: Another markdown file.

### Additional Information

- **Languages:** Shell (100.0%)  
- **Releases:** No releases published  
- **Packages:** No packages published

### Usage

To use the repository for setting up a local Kubernetes environment with Redis:

1. Clone the repository to your local machine.
2. Execute the shell scripts in the appropriate order to start Minikube, set up Redis, and manage the Redis master-slave configuration.
3. Use the Kubernetes configuration files to deploy and manage Redis within the Kubernetes environment.

### Conclusion

The `ha_master_slave_and_some_tasks_around_redis-db` repository provides a comprehensive set of scripts and resources for developers to easily set up and manage a local Kubernetes environment with Redis. It is designed to facilitate development and testing tasks related to Redis master-slave configurations.

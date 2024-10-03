---

# HA Master-Slave Redis with Kubernetes

This repository provides scripts and Kubernetes configuration files for setting up **Redis** in a **master-slave** architecture with optional **Redis Sentinel** for high availability and automatic failover, all within a local **Kubernetes** environment using **Minikube**.

## Table of Contents
- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Setup Instructions](#setup-instructions)
- [Kubernetes Configurations](#kubernetes-configurations)
- [Scripts](#scripts)
- [Usage](#usage)
- [Monitoring and Health Checks](#monitoring-and-health-checks)
- [Redis Sentinel](#redis-sentinel)
- [Scaling Redis](#scaling-redis)
- [Cleanup](#cleanup)
- [License](#license)

## Overview

The goal of this repository is to provide resources that allow you to:
- Deploy a Redis master-slave setup within a Kubernetes cluster using Minikube.
- Optionally integrate **Redis Sentinel** to monitor the master-slave relationship and handle automatic failover.
- Use **Kubernetes StatefulSets**, **Deployments**, and **Persistent Volumes** for Redis instances.

This setup is ideal for development and testing environments.

## Prerequisites

Make sure you have the following installed:
- [Docker](https://docs.docker.com/get-docker/)
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Redis CLI](https://redis.io/topics/rediscli)

## Setup Instructions

1. **Start Minikube**:
   Run the `00-minikube-up.sh` script to start Minikube.
   ```bash
   ./00-minikube-up.sh
   ```

2. **Deploy Redis**:
   Deploy the Redis master and slave services using the `01-redis-up.sh` script.
   ```bash
   ./01-redis-up.sh
   ```

3. **Check Redis Info**:
   Verify the Redis setup by running the `02-redis-info.sh` script to get information about the Redis instances.
   ```bash
   ./02-redis-info.sh
   ```

## Kubernetes Configurations

The repository contains several Kubernetes YAML files for managing Redis:

- `redis-master.yaml`: Defines the Redis master deployment.
- `redis-slave.yaml`: Defines the Redis slave deployment.
- `redis-master-statefulset.yaml`: Deploys Redis master as a StatefulSet with persistent storage.
- `redis-slave-statefulset.yaml`: Deploys Redis slave as a StatefulSet with persistent storage.
- `redis-sentinel.yaml`: Configures Redis Sentinel for monitoring and failover.
- `redis-namespace.yaml`: Defines the Redis namespace for easier management.

## Scripts

### Shell Scripts:
- `00-minikube-up.sh`: Starts Minikube with required resources.
- `01-redis-up.sh`: Deploys Redis master and slave services along with optional Sentinel.
- `02-redis-info.sh`: Displays the Redis master/slave info.
- `redisClean.sh`: Cleans Redis data if needed.
- `redisImport.sh`: Imports data into Redis.

### Optional Sentinel:
If Redis Sentinel is not required, you can comment out or skip the section in `01-redis-up.sh` that deploys the `redis-sentinel.yaml` file.

## Usage

1. **Start Minikube**:
   ```bash
   ./00-minikube-up.sh
   ```

2. **Deploy Redis Master and Slave**:
   ```bash
   ./01-redis-up.sh
   ```

3. **Check Redis Cluster Status**:
   To check the current status of the Redis instances:
   ```bash
   ./02-redis-info.sh
   ```

## Monitoring and Health Checks

The Redis master and slave deployments include **liveness** and **readiness** probes. These are essential to monitor the health of the Redis instances and ensure Kubernetes automatically restarts unhealthy pods.

- **Liveness Probe**: Ensures the Redis service is alive by periodically running the `redis-cli ping` command.
- **Readiness Probe**: Verifies that Redis is ready to serve traffic by also using the `redis-cli ping` command.

## Redis Sentinel

To enable Redis Sentinel for automatic failover, the `redis-sentinel.yaml` configuration deploys three Sentinel instances. Sentinel continuously monitors the master, and in case of failure, promotes one of the slaves to be the new master.

- Sentinel configures the Redis master via the `sentinel.conf` file.
- Three replicas of Sentinel ensure consensus in failover decisions.

## Scaling Redis

If you need more Redis slave instances, you can scale the number of replicas in the `redis-slave-statefulset.yaml`:

```yaml
spec:
  replicas: 2  # Increase this number for more Redis slave instances
```

Alternatively, consider adding **Horizontal Pod Autoscaler** to dynamically scale Redis slave instances based on CPU/memory usage.

## Cleanup

To tear down the Redis setup and stop Minikube:
1. Stop Redis services:
   ```bash
   ./98-redis-down.sh
   ```

2. Stop Minikube:
   ```bash
   ./99-minikube-down.sh
   ```

## License

This project is licensed under the BSD-2-Clause license. See the [LICENSE](./LICENSE) file for details.

---

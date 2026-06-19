# eShop on Kubernetes – DevOps Engineer Final Project

## Overview

This project demonstrates the deployment and operation of a cloud-native microservices application using modern DevOps practices.

The application is based on Microsoft's eShop reference application and was used as a platform to implement containerization, Kubernetes orchestration, CI/CD automation, monitoring, security, and environment management.

The primary objective of this project was not software development, but the application of DevOps principles in a production-like environment.

---

# Architecture

## High-Level Architecture

```text
Users
   │
   ▼
Traefik Ingress
   │
   ▼
WebApp
   │
   ├── Catalog API
   ├── Basket API
   ├── Identity API
   ├── Ordering API
   └── Webhooks API

Supporting Services
   ├── PostgreSQL
   ├── Redis
   └── RabbitMQ

Background Services
   ├── Order Processor
   └── Payment Processor
```

---

# Technology Stack

## Application

* .NET 10
* ASP.NET Core
* Microsoft eShop Reference Application

## Containerization

* Docker
* Docker Hub

## Orchestration

* Kubernetes (k3s)
* Traefik Ingress Controller

## CI/CD

* GitHub Actions
* Self-hosted GitHub Runner

## Infrastructure

The platform is hosted on a Proxmox hypervisor running an Ubuntu Linux virtual machine.

Core infrastructure components:

* Terraform (Infrastructure as Code)
* Proxmox VE
* Ubuntu Server
* k3s Kubernetes Cluster
* Traefik Ingress Controller
* Docker Hub Container Registry
* GitHub Self-Hosted Runner
* Kubernetes Namespaces (dev, prod, monitoring)
---

# Project Requirements Covered

| Requirement                | Implemented |
| -------------------------- | ----------- |
| Dockerized Application     | ✅           |
| Dev Environment            | ✅           |
| Production Environment     | ✅           |
| Automated CI/CD            | ✅           |
| Kubernetes Deployment      | ✅           |
| Infrastructure as Code     | ✅           |
| Monitoring                 | ✅           |
| Security Considerations    | ✅           |
| Disaster Recovery Planning | ✅           |
| Documentation              | ✅           |

---

# Dockerization

All application services are containerized using Docker.

Docker images are stored in Docker Hub and automatically updated through the CI/CD pipeline.

Examples:

* kamilburuk/eshop-webapp
* kamilburuk/eshop-catalog-api
* kamilburuk/eshop-basket-api
* kamilburuk/eshop-identity-api
* kamilburuk/eshop-ordering-api

---

# Kubernetes Deployment

The application is deployed on a k3s Kubernetes cluster.

Resources include:

* Deployments
* Services
* Secrets
* ConfigMaps
* Ingress resources

Namespaces:

```text
dev
prod
monitoring
```

---

# Development Environment

Development workloads are deployed to the `dev` namespace.

Characteristics:

* Latest container images
* Continuous deployment enabled
* Testing environment for new changes

Example URL:

```text
https://dev.eshop.course-datascientest2026.cloud-ip.cc
```

---

# Production Environment

Production workloads are deployed to the `prod` namespace.

Characteristics:

* Versioned container images
* Isolated configuration
* Separate ingress routes
* Stable deployment environment

Example URL:

```text
https://eshop.course-datascientest2026.cloud-ip.cc
```

---

# CI/CD Pipeline

The project uses GitHub Actions for Continuous Integration and Continuous Deployment.

Pipeline workflow:

```text
Developer Push
        →
GitHub Repository
        →
GitHub Actions
        →
Build & Test
        →
Build Docker Images
        →
Push Images to Docker Hub
        →
Deploy to Kubernetes
```

A self-hosted GitHub Actions Runner is installed on the deployment VM to execute Kubernetes deployment jobs.

---

## Infrastructure as Code

Infrastructure provisioning is automated using Terraform.

Terraform is used to create and manage the virtual machine environment on the Proxmox platform, while Kubernetes manifests define the application deployment configuration.

Components managed as code:

* Virtual machine provisioning with Terraform
* Kubernetes Deployments
* Kubernetes Services
* Kubernetes Secrets
* Kubernetes Ingress Resources
* Monitoring Stack Configuration
---

## Monitoring

Monitoring is implemented using the **kube-prometheus-stack Helm Chart**, which provides a complete Kubernetes monitoring solution.

Components:

* Prometheus
* Grafana
* Node Exporter
* kube-state-metrics
* Alertmanager

Capabilities:

* Kubernetes cluster monitoring
* Pod and node health monitoring
* Resource utilization metrics
* Infrastructure observability
* Grafana dashboards for visualization

---

# Security Considerations

The project incorporates several DevSecOps practices:

### Kubernetes Secrets

Sensitive configuration values are stored using Kubernetes Secrets.

### GitHub Secrets

Docker Hub credentials are stored securely in GitHub Secrets and are not hardcoded in source code.

### HTTPS/TLS

Traefik Ingress is configured to support HTTPS for application endpoints.

### Principle of Separation

Development and Production environments are isolated using separate namespaces and configuration values.

---

# Disaster Recovery

## Source Control

All source code and deployment manifests are stored in GitHub.

## Container Images

All container images are stored in Docker Hub and can be redeployed at any time.

## Infrastructure Recovery

The Kubernetes cluster can be rebuilt using the repository manifests.

## Rollback Strategy

Previous application versions can be restored by redeploying a previously published image tag.

---

# Known Limitations

The application deploys successfully in Kubernetes and all services are reachable.

Authentication currently requires additional application-level troubleshooting due to OpenID Connect configuration behavior behind the reverse proxy. This does not impact the infrastructure, CI/CD, containerization, monitoring, or Kubernetes deployment objectives of the project.

---

# Deployment

## Deploy Development

```bash
kubectl apply -R -f k8s/dev
```

## Deploy Production

```bash
kubectl apply -R -f k8s/prod
```

---

# Monitoring Access

Grafana:

```text
http://localhost:3000
```

Prometheus:

```text
http://localhost:9090
```

---

# Author

Kamil Buruk

DevOps Engineer Final Project

DataScientest 2026

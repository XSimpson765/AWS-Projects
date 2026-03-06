# AWS Cloud Engineering Projects

This repository contains hands-on AWS infrastructure projects built using **Terraform**.

The goal of these projects is to demonstrate real-world **cloud engineering practices**, including Infrastructure as Code, secure AWS networking architecture, monitoring, and production-style Terraform project structure.

---

## Projects

### 1. Secure Web Baseline

**Directory:** `project-01-secure-web-baseline`

Architecture:

![Architecture](project-01-secure-web-baseline/project-01-architecture.png.drawio.png)

**Key components**

* Custom VPC
* Public Application Load Balancer
* Private EC2 instance running Nginx
* NAT Gateway for outbound access
* Secure public/private subnet architecture
* Hardened security groups

This project demonstrates **secure AWS network design and load-balanced web infrastructure**.

---

### 2. Terraform Remote Backend

**Directory:** `project-02-terraform-backend`

**Key components**

* S3 bucket for Terraform state storage
* DynamoDB table for Terraform state locking
* Server-side encryption enabled
* Versioning enabled
* Public access blocked

This project demonstrates **production-grade Terraform state management best practices**.

---

### 3. Production Web Platform

**Directory:** `project-03-prod-web-platform`

Architecture:

![Architecture](project-03-prod-web-platform/project-03-architecture.png)

**Key components**

* Multi-file Terraform architecture
* Custom VPC with public and private subnets
* Internet Gateway + NAT Gateway
* Application Load Balancer
* Private EC2 instance running Nginx
* IAM role attached to EC2
* CloudWatch monitoring and alarms
* Secure security group configuration

This project simulates a **real-world cloud infrastructure deployment with monitoring and observability**.

---

## Skills Demonstrated

* Terraform Infrastructure as Code
* AWS VPC architecture design
* Public vs Private subnet segmentation
* Application Load Balancer configuration
* NAT Gateway implementation
* IAM role-based access control
* CloudWatch monitoring and alarms
* Secure Terraform remote backend setup
* Production-style AWS infrastructure design

---

### 4. Cloud Ops Platform (CI/CD → ECR → EKS)

**Directory:** `project4-cloud-ops-platform`

**What it is:** A production-style CI/CD pipeline that builds a Docker image, pushes it to Amazon ECR, and deploys it to Amazon EKS using GitHub Actions (rolling updates).

**Key components**
* Dockerized NGINX web app (`app/`)
* GitHub Actions workflow (`.github/workflows/deploy-eks.yml`)
* Amazon ECR repository (image registry)
* Amazon EKS deployment + service (`kubernetes/`)
* AWS Load Balancer public endpoint

This project demonstrates **real-world DevOps workflow automation**: build → push → deploy with Kubernetes rolling updates.

## Author

**Xavier Simpson**
AWS Certified Solutions Architect – Associate

GitHub: https://github.com/XSimpson765

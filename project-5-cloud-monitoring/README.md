# Project 5 – Cloud Monitoring Infrastructure (Terraform)

This project demonstrates automated AWS infrastructure deployment and monitoring using **Terraform Infrastructure as Code (IaC)**.

The environment provisions an EC2 instance and implements monitoring using **Amazon CloudWatch** with automated alerting via **Amazon SNS**.

---

# Architecture

EC2 Instance
↓
CloudWatch Metrics
↓
CloudWatch Alarm (CPU Utilization > 70%)
↓
SNS Topic Alert

---

# Technologies

* Terraform
* AWS EC2
* AWS CloudWatch
* AWS SNS
* Infrastructure as Code (IaC)

---

# Infrastructure Components

## EC2 Instance

* Amazon Linux 2023 AMI
* Instance type: `t2.micro`
* Tagged using Terraform variables
* Provisioned using Terraform resource blocks

## CloudWatch Alarm

Monitors EC2 CPU utilization and triggers when usage exceeds:

```
70% CPU utilization
```

Configuration:

* Metric: `CPUUtilization`
* Namespace: `AWS/EC2`
* Statistic: `Average`
* Evaluation Periods: `2`
* Period: `120 seconds`

## SNS Alert Topic

An SNS topic is created to receive alarm notifications.

```
cloud-monitoring-alerts
```

---

# Terraform Structure

```
project-5-cloud-monitoring
│
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
│
├── monitoring/
│   ├── alarms.tf
│   └── cloudwatch.tf
│
└── README.md
```

---

# Deployment Steps

Initialize Terraform:

```
terraform init
```

Validate configuration:

```
te
```

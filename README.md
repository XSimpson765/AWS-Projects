# AWS Projects Portfolio

This repository contains hands-on AWS infrastructure projects built using Terraform.

Each project is designed to demonstrate production-grade cloud engineering practices, Infrastructure as Code (IaC), secure network design, and real-world DevOps patterns.

---

## Projects

### 1. Secure Web Baseline (project-01-secure-web-baseline)

- Custom VPC
- Public Application Load Balancer
- Private EC2 instance
- NAT Gateway for outbound access
- Remote Terraform backend (S3 + DynamoDB)
- Security group hardening
- Private subnet architecture

This project demonstrates foundational AWS production design and secure network segmentation.

---

### 2. Terraform Remote Backend (project-02-terraform-backend)

- S3 bucket for Terraform state storage
- DynamoDB table for state locking
- Server-side encryption enabled
- Versioning enabled
- Public access blocked
- Production-ready remote backend configuration

This project demonstrates enterprise Terraform state management best practices.

---

### 3. Production Web Platform (project-03-prod-web-platform)

- Structured multi-file Terraform architecture
- Custom VPC with public and private subnets
- Internet Gateway + NAT Gateway
- Public Application Load Balancer
- Private EC2 instance running Nginx
- IAM role attached to EC2
- CloudWatch monitoring and alarms
- Secure security group configuration

This project simulates a real-world cloud engineering deployment with production-style structure and observability.

---

## Skills Demonstrated

- Terraform Infrastructure as Code
- AWS VPC architecture design
- Public vs Private subnet segmentation
- Application Load Balancer configuration
- NAT Gateway implementation
- IAM role-based access control
- CloudWatch monitoring and alarms
- Secure Terraform remote backend setup
- Production-ready AWS design principles

---

## Author

Xavier Simpson  
AWS Certified Solutions Architect – Associate  
GitHub: XSimpson765
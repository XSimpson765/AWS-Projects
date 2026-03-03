# Project 01 – AWS Secure Web Baseline (Terraform)

## Overview

This project implements a secure, production-style AWS web architecture using Terraform.

The goal was to deploy a private EC2 instance behind a public Application Load Balancer while enforcing security best practices and remote state management.

---

## Architecture

- Custom VPC (us-east-1)
- 2 Public Subnets (for ALB + NAT)
- 2 Private Subnets (for EC2)
- NAT Gateway for outbound internet access
- Application Load Balancer (public)
- Target Group + Listener (HTTP:80)
- Private EC2 instance running Nginx
- S3 Remote Terraform Backend
- DynamoDB State Locking

---

## Security Controls

- EC2 instance has **no public IP**
- Security Group allows traffic:
  - Internet → ALB (port 80)
  - ALB → EC2 (port 80 only)
- Remote Terraform state stored in encrypted S3
- State locking enforced via DynamoDB
- No SSH exposed to the internet

---

## Terraform Backend

Remote backend implemented using:

- S3 bucket for state storage
- Server-side encryption enabled
- DynamoDB table for state locking

This prevents:
- State corruption
- Concurrent apply conflicts
- Local state exposure

---

## Verification

### 1. ALB Response


Instance is private-only.

---

## Key Terraform Resources

- aws_vpc
- aws_subnet
- aws_nat_gateway
- aws_lb
- aws_lb_target_group
- aws_instance
- aws_security_group
- aws_s3_bucket
- aws_dynamodb_table

---

## What This Demonstrates

- Infrastructure as Code (Terraform)
- Network segmentation (public vs private)
- Secure ALB architecture
- Remote backend best practices
- Cloud production design fundamentals

---

## Future Enhancements

- HTTPS with ACM certificate
- Auto Scaling Group
- WAF integration
- CloudWatch alarms
- ALB access logging
- CI/CD pipeline integration

---

## Author

Xavier Simpson  
AWS Certified Solutions Architect – Associate  
GitHub: XSimpson765
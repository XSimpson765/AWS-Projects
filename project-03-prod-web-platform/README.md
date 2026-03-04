# Project 03 – Production Web Platform (Terraform)

## Overview

This project implements a production-style AWS web platform using Terraform.

The objective was to simulate a real-world cloud engineering environment by deploying a highly structured, secure, and scalable web infrastructure following infrastructure-as-code best practices.

This project builds upon previous foundations and introduces production-ready architecture patterns.

---

## Architecture

- Custom VPC (us-east-1)
- Public Subnets for Application Load Balancer
- Private Subnets for EC2 instances
- Internet Gateway
- NAT Gateway for outbound access
- Application Load Balancer (public-facing)
- Target Group + Listener (HTTP:80)
- Private EC2 instance running Nginx
- IAM Role attached to EC2
- CloudWatch monitoring and alarms
- Modular Terraform file structure
- ![Architecture](project-03-architecture.png)

---

## Security Controls

- EC2 instance has no public IP
- Traffic flow restricted:
  - Internet → ALB (port 80)
  - ALB → EC2 (port 80 only)
- No direct SSH exposure to internet
- IAM role used instead of hardcoded credentials
- Security groups enforce least privilege access
- Private subnet isolation for compute resources

---

## Terraform Structure

Terraform configuration separated by responsibility:

- vpc.tf
- subnets.tf
- igw.tf
- nat.tf
- route_tables.tf
- alb.tf
- ec2_private.tf
- security_groups.tf
- iam.tf
- cloudwatch.tf
- outputs.tf
- versions.tf

This structure mirrors real-world production repositories.

---

## Deployment Workflow

Initialize Terraform:

terraform init

Validate configuration:

terraform validate

Review execution plan:

terraform plan

Apply infrastructure:

terraform apply

Destroy resources (when finished):

terraform destroy

---

## Monitoring & Observability

- CloudWatch alarm configured for EC2 CPU utilization
- Metrics monitored through AWS CloudWatch
- Alarm triggers when threshold exceeded
- Production-style observability baseline implemented

---

## Verification

1. Confirm ALB DNS name resolves in browser.
2. Verify Nginx default page loads successfully.
3. Confirm EC2 instance is private-only.
4. Validate NAT Gateway allows outbound updates.
5. Confirm CloudWatch alarm visible in console.
6. Confirm IAM role attached to EC2.

---

## Key Terraform Resources

- aws_vpc
- aws_subnet
- aws_internet_gateway
- aws_nat_gateway
- aws_route_table
- aws_lb
- aws_lb_target_group
- aws_lb_listener
- aws_instance
- aws_security_group
- aws_iam_role
- aws_cloudwatch_metric_alarm

---

## What This Demonstrates

- Advanced Terraform project structuring
- Production-grade AWS architecture design
- Private compute behind load balancer
- IAM role-based access control
- CloudWatch monitoring implementation
- Network segmentation best practices
- Real-world cloud engineering patterns

---

## Future Enhancements

- HTTPS with ACM certificate
- Auto Scaling Group
- Launch Template integration
- Blue/Green deployments
- WAF integration
- Centralized logging
- CI/CD pipeline automation

---

## Author

Xavier Simpson
AWS Certified Solutions Architect – Associate
GitHub: XSimpson765

## Documentation

Architecture Diagram:

- View Architecture: [Architecture Diagram](project-03-architecture.png)

Relevant AWS documentation for services used in this project:

- Amazon VPC: https://docs.aws.amazon.com/vpc/
- EC2: https://docs.aws.amazon.com/ec2/
- Application Load Balancer: https://docs.aws.amazon.com/elasticloadbalancing/latest/application/
- NAT Gateway: https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html
- IAM Roles: https://docs.aws.amazon.com/IAM/
- CloudWatch Monitoring: https://docs.aws.amazon.com/cloudwatch/

# Project 01 – AWS Secure Web Baseline (Terraform)

## Overview

This project implements a secure, production-style AWS web architecture using Terraform.

The goal was to deploy a private EC2 instance behind a public Application Load Balancer while enforcing security best practices and remote state management.

---

## Architecture

- Custom VPC (us-east-1)
- 2 Public Subnets (for ALB + NAT)
- 2 Private Subnets (for EC2)
- Internet Gateway
- NAT Gateway for outbound internet access
- Application Load Balancer (public)
- Target Group + Listener (HTTP:80)
- Private EC2 instance running Nginx
- S3 Remote Terraform Backend
- DynamoDB State Locking
- ![Architecture Diagram](project-01-architecture.png.drawio.png)

---

## Security Controls

- EC2 instance has no public IP
- Security Group rules:
  - Internet → ALB (port 80)
  - ALB → EC2 (port 80 only)
- No inbound SSH exposed to the internet
- Remote Terraform state stored in encrypted S3
- State locking enforced via DynamoDB
- Public access blocked on S3 backend bucket

---

## Terraform Backend

Remote backend implemented using:

- S3 bucket for state storage
- Server-side encryption enabled
- Versioning enabled
- DynamoDB table for state locking

This prevents:

- State corruption
- Concurrent apply conflicts
- Local state exposure
- Accidental state deletion

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

## Verification

1. Confirm ALB DNS name resolves in browser.
2. Verify Nginx default page loads through ALB.
3. Confirm EC2 instance has no public IP.
4. Confirm NAT Gateway allows outbound updates.
5. Confirm remote state stored in S3.
6. Confirm DynamoDB lock entry created during apply.

Instance remains private-only behind the load balancer.

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
- aws_s3_bucket
- aws_dynamodb_table

---

## What This Demonstrates

- Infrastructure as Code (Terraform)
- Secure VPC network segmentation (public vs private)
- ALB-based production web architecture
- Private EC2 deployment pattern
- Remote backend implementation
- Cloud security best practices
- Production-grade AWS design fundamentals

---

## Future Enhancements

- HTTPS with ACM certificate
- Auto Scaling Group integration
- AWS WAF integration
- CloudWatch alarms and monitoring
- ALB access logging to S3
- CI/CD pipeline integration

---

## Author

Xavier Simpson
AWS Certified Solutions Architect – Associate
GitHub: XSimpson765

## Documentation

Additional documentation for this project:

- Architecture Diagram: [View Architecture](project-01-architecture.png.drawio.png)

Relevant AWS documentation for services used in this project:

- Amazon VPC: https://docs.aws.amazon.com/vpc/
- EC2: https://docs.aws.amazon.com/ec2/
- Application Load Balancer: https://docs.aws.amazon.com/elasticloadbalancing/latest/application/
- NAT Gateway: https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html
- IAM Roles: https://docs.aws.amazon.com/IAM/
- CloudWatch Monitoring: https://docs.aws.amazon.com/cloudwatch/

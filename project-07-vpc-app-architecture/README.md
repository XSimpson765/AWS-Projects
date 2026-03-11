# Project 7 – Terraform VPC App Architecture

This project defines a production-style AWS three-tier application architecture using Terraform.

## Architecture

Internet → ALB → Auto Scaling EC2 → RDS

## Core Components

- Custom VPC
- 2 public subnets
- 2 private application subnets
- 2 private database subnets
- Internet Gateway
- Public and private route tables
- Application Load Balancer
- Target Group and Listener
- Launch Template
- Auto Scaling Group
- RDS MySQL database
- Security groups for ALB, EC2, and RDS

## Security Design

- ALB accepts HTTP from the internet
- EC2 accepts HTTP only from the ALB security group
- RDS accepts MySQL only from the EC2 security group
- Database is deployed in private DB subnets

## Technologies Used

- Terraform
- AWS VPC
- AWS Subnets
- AWS Internet Gateway
- AWS Route Tables
- AWS Security Groups
- AWS Application Load Balancer
- AWS Auto Scaling
- AWS EC2
- AWS RDS MySQL

## Status

Terraform architecture complete.  
Application bootstrap and connectivity testing can be refined in later iterations.
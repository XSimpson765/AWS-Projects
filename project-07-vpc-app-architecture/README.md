# Project 7 – Terraform VPC App Architecture

This project builds a production-style AWS application architecture using Terraform.

## Architecture

Internet → ALB (Public Subnets) → EC2 Auto Scaling (Private App Subnets) → RDS (Private DB Subnets)

## Core Components

- VPC with DNS support
- 2 public subnets
- 2 private application subnets
- 2 private database subnets
- Internet Gateway
- NAT Gateway
- Public and private route tables

## Technologies Used

- Terraform
- AWS VPC
- AWS Subnets
- AWS Internet Gateway
- AWS NAT Gateway
- AWS Route Tables

## Status

Phase 1 complete: networking foundation
# Project 02 – Terraform Remote Backend with S3 and DynamoDB

## Overview

This project provisions a secure and scalable Terraform remote backend using AWS S3 for state storage and DynamoDB for state locking.

The goal of this project is to implement production-grade Terraform state management best practices, preventing state corruption and enabling collaborative infrastructure workflows.

---

## Architecture Components

- Amazon S3 Bucket (Terraform state storage)
- DynamoDB Table (State locking and concurrency control)
- Versioning enabled on S3 bucket
- Server-side encryption enabled
- Public access blocked
- Terraform backend configuration

---

## Why Remote State Matters

By default, Terraform stores state locally. This creates risks:

- State file loss
- Team conflicts
- State corruption
- No locking mechanism
- No centralized source of truth

This project solves those problems by:

- Storing state in S3
- Enforcing locking with DynamoDB
- Enabling safe multi-user Terraform operations

---

## S3 Configuration

- Versioning enabled
- Encryption enabled
- Public access blocked
- Private bucket policy
- State file stored under defined key path

Example backend configuration:

terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket-name"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}

---

## DynamoDB Configuration

- Partition key: LockID
- Used for state locking
- Prevents simultaneous terraform apply operations
- Ensures safe concurrent infrastructure deployments
- On-demand billing mode enabled

---

## Terraform Workflow

Initialize backend:

terraform init

Validate configuration:

terraform validate

Review execution plan:

terraform plan

Apply infrastructure:

terraform apply

Destroy resources (if needed):

terraform destroy

---

## Validation Performed

- Verified state file stored in S3
- Confirmed versioning enabled
- Confirmed encryption enabled
- Confirmed public access blocked
- Confirmed DynamoDB lock entry created during apply
- Verified state lock released after completion
- Confirmed backend reinitialization works across sessions

---

## What This Project Demonstrates

- Terraform remote backend configuration
- S3 security best practices
- DynamoDB-based state locking
- Production-grade IaC workflow
- Collaborative infrastructure design principles
- Infrastructure lifecycle management
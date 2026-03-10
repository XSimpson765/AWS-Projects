# Project 6 – Terraform Infrastructure CI/CD

This project demonstrates automated Terraform infrastructure deployment workflows using GitHub Actions.

## Architecture

```mermaid
flowchart LR

Developer --> GitHub
GitHub --> GitHubActions[GitHub Actions Pipeline]
GitHubActions --> Terraform
Terraform --> AWS[EC2 Infrastructure]
```

## Technologies

- Terraform
- AWS EC2
- GitHub Actions
- Infrastructure as Code (IaC)

## Pipeline Flow

Developer → GitHub → GitHub Actions → Terraform → AWS Infrastructure

## Skills Demonstrated

- Terraform Infrastructure as Code
- CI/CD pipeline automation
- GitHub Actions workflows
- Automated infrastructure validation
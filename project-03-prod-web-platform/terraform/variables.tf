variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "project_name" {
  type        = string
  description = "Project name used for naming/tagging"
  default     = "project-03-prod-web-platform"
}

variable "environment" {
  type        = string
  description = "Environment name"
  default     = "dev"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
  default     = "10.30.0.0/16"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public subnet CIDRs (one per AZ, must be 2 for this project)"
  default     = ["10.30.0.0/24", "10.30.1.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private subnet CIDRs (one per AZ, must be 2 for this project)"
  default     = ["10.30.10.0/24", "10.30.11.0/24"]
}

variable "alb_ingress_cidrs" {
  type        = list(string)
  description = "Who can access the ALB on port 80"
  default     = ["0.0.0.0/0"]
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type for ASG"
  default     = "t3.micro"
}

variable "asg_min_size" {
  type    = number
  default = 2
}

variable "asg_desired_capacity" {
  type    = number
  default = 2
}

variable "asg_max_size" {
  type    = number
  default = 4
}
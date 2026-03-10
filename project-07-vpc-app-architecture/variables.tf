variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "public_subnet_1_cidr" {
  description = "Public subnet 1 CIDR"
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "Public subnet 2 CIDR"
  type        = string
}

variable "private_app_subnet_1_cidr" {
  description = "Private app subnet 1 CIDR"
  type        = string
}

variable "private_app_subnet_2_cidr" {
  description = "Private app subnet 2 CIDR"
  type        = string
}

variable "private_db_subnet_1_cidr" {
  description = "Private DB subnet 1 CIDR"
  type        = string
}

variable "private_db_subnet_2_cidr" {
  description = "Private DB subnet 2 CIDR"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}
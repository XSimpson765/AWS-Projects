############################################
# main.tf — Project 4 (COST-SAVER LAB SETUP)
# - VPC with PUBLIC subnets only (no NAT)
# - EKS cluster + managed node group in PUBLIC subnets
# - Cheaper node size for portfolio testing
############################################

data "aws_availability_zones" "available" {}

############################################
# VPC (No NAT Gateway)
############################################
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "${var.cluster_name}-vpc"
  cidr = "10.0.0.0/16"

  # Use 2 AZs for resiliency (still low cost)
  azs = slice(data.aws_availability_zones.available.names, 0, 2)

  # Public subnets (EKS nodes will live here for lab)
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]

  # Keep private subnets OPTIONAL (not used for nodes in this lab)
  # You can remove these entirely if you want, but leaving them does not create NAT costs.
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

  # COST SAVER: No NAT Gateways
  enable_nat_gateway = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  # Tags required for Kubernetes load balancers
  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
  }

  # Helpful tags
  tags = {
    Project = "Project4-CloudOps-Platform"
  }
}

############################################
# EKS Cluster (Nodes in PUBLIC subnets)
############################################
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"

  vpc_id = module.vpc.vpc_id

  # LAB SETUP: Use PUBLIC subnets so nodes can reach internet without NAT
  subnet_ids = module.vpc.public_subnets

  # Optional: Let the cluster endpoint be public for easier local access in a lab
  cluster_endpoint_public_access = true

  eks_managed_node_groups = {
    default = {
      # COST SAVER: smaller/cheaper instance
      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }

  tags = {
    Project = "Project4-CloudOps-Platform"
  }
}
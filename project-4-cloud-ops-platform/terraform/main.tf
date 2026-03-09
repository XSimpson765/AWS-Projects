############################################
# main.tf — Project 4 (COST-SAVER LAB SETUP)
# - VPC with PUBLIC subnets (no NAT)
# - Public subnets auto-assign public IPs (required for nodes)
# - EKS cluster + managed node group in PUBLIC subnets
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

  # PUBLIC subnets (EKS nodes will live here for this lab)
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]

  # Private subnets can remain defined (no NAT = no NAT cost)
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

  # COST SAVER: No NAT Gateway
  enable_nat_gateway = false

  # IMPORTANT FIX:
  # Worker nodes in public subnets must be able to get public IPs automatically
  map_public_ip_on_launch = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  # Kubernetes LoadBalancer support (public ELBs)
  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
  }

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

  # LAB SETUP: Use public subnets so nodes have internet without NAT
  subnet_ids = module.vpc.public_subnets

  # Easier access for a lab from Codespaces
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
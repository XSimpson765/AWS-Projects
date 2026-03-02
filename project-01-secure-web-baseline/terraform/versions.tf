terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket         = "terraform-20260302203714845100000001"
    key            = "project-01/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}
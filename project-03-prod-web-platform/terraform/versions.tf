terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket         = "xsimpson-tf-state-668429212775"
    key            = "project-03/terraform.tfstate"
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
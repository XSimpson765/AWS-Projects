variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "state_bucket_name" {
  type = string
  # MUST be globally unique across all AWS accounts
}

variable "lock_table_name" {
  type    = string
  default = "terraform-locks"
}
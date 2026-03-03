############################################
# VPC Outputs
############################################

output "vpc_id" {
  value       = aws_vpc.this.id
  description = "VPC ID"
}

output "public_subnet_ids" {
  value       = [aws_subnet.public_a.id, aws_subnet.public_b.id]
  description = "Public subnet IDs"
}

output "private_subnet_ids" {
  value       = [aws_subnet.private_a.id, aws_subnet.private_b.id]
  description = "Private subnet IDs"
}

############################################
# Load Balancer Outputs
############################################

output "alb_dns_name" {
  description = "Public DNS name of the Application Load Balancer"
  value       = aws_lb.this.dns_name
}

output "alb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.this.arn
}

output "http_listener_arn" {
  description = "ARN of the HTTP listener"
  value       = aws_lb_listener.http.arn
}

output "target_group_arn" {
  description = "ARN of the target group"
  value       = aws_lb_target_group.this.arn
}

############################################
# EC2 Outputs
############################################

output "ec2_instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.private.id
}

output "ec2_private_ip" {
  description = "EC2 private IP address"
  value       = aws_instance.private.private_ip
}
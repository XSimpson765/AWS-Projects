output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_1_id" {
  value = aws_subnet.public_1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_2.id
}

output "private_app_subnet_1_id" {
  value = aws_subnet.private_app_1.id
}

output "private_app_subnet_2_id" {
  value = aws_subnet.private_app_2.id
}

output "private_db_subnet_1_id" {
  value = aws_subnet.private_db_1.id
}

output "private_db_subnet_2_id" {
  value = aws_subnet.private_db_2.id
}

output "alb_dns_name" {
  value = aws_lb.app_alb.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.app_tg.arn
}

output "rds_endpoint" {
  value = aws_db_instance.app_db.endpoint
}

output "rds_db_name" {
  value = aws_db_instance.app_db.db_name
}
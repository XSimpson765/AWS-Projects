output "instance_id" {
  value = aws_instance.cicd_instance.id
}

output "public_ip" {
  value = aws_instance.cicd_instance.public_ip
}
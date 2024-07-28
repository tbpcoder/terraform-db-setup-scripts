output "instance_details" {
  value = aws_instance.db_instance[*].id
}

output "private_dns" {
  value = aws_instance.db_instance[*].private_dns
}

output "security_group_id" {
  value = aws_security_group.database_sg.id
}
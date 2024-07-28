output "mongo_instance_details" {
  value = aws_instance.mongo_db_instance[*].id
}

output "mysql_instance_details" {
  value = aws_instance.mysql_db_instance[*].id
}

output "postgresql_instance_details" {
  value = aws_instance.postgresql_db_instance[*].id
}

output "scylla_instance_details" {
  value = aws_instance.scylla_db_instance[*].id
}

output "elasticsearch_instance_details" {
  value = aws_instance.elasticsearch_db_instance[*].id
}

output "mongo_private_dns" {
  value = aws_instance.mongo_db_instance[*].private_dns
}

output "mysql_private_dns" {
  value = aws_instance.mysql_db_instance[*].private_dns
}

output "postgresql_private_dns" {
  value = aws_instance.postgresql_db_instance[*].private_dns
}

output "scylla_private_dns" {
  value = aws_instance.scylla_db_instance[*].private_dns
}

output "elasticsearch_private_dns" {
  value = aws_instance.elasticsearch_db_instance[*].private_dns
}

output "mongo_security_group_id" {
  value = aws_security_group.mongo_database_sg.id
}

output "mysql_security_group_id" {
  value = aws_security_group.mysql_database_sg.id
}

output "postgresql_security_group_id" {
  value = aws_security_group.postgresql_database_sg.id
}

output "scylla_security_group_id" {
  value = aws_security_group.scylla_database_sg.id
}

output "elasticsearch_security_group_id" {
  value = aws_security_group.elasticsearch_database_sg.id
}
output "rds_endpoint" {
  description = "RDS DNS endpoint."
  value       = aws_db_instance.mysql.address
}

output "rds_port" {
  value = aws_db_instance.mysql.port
}

output "database_name" {
  value = aws_db_instance.mysql.db_name
}

output "rds_security_group_id" {
  value = aws_security_group.rds.id
}

output "application_instance_id" {
  value = aws_instance.application.id
}

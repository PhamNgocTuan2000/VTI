output "db_endpoint" {
  description = "The connection endpoint"
  value       = aws_db_instance.postgresql.endpoint
}

output "db_name" {
  description = "The database name"
  value       = aws_db_instance.postgresql.db_name
}

output "db_instance_id" {
  description = "The RDS instance ID"
  value       = aws_db_instance.postgresql.id
}

output "db_security_group_id" {
  description = "The security group ID"
  value       = aws_security_group.postgresql.id
}

output "ssm_parameter_host" {
  description = "SSM parameter name for database host"
  value       = aws_ssm_parameter.db_host.name
}

output "ssm_parameter_username" {
  description = "SSM parameter name for database username"
  value       = aws_ssm_parameter.db_username.name
}
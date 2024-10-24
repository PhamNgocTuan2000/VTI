resource "aws_db_instance" "postgresql" {
  identifier           = var.db_identifier
  engine              = "postgres"
  engine_version      = "13.3"
  instance_class      = var.instance_class
  allocated_storage   = var.allocated_storage
  storage_type        = "gp2"
  username           = var.db_username
  password           = var.db_password
  skip_final_snapshot = true

  vpc_security_group_ids = [aws_security_group.postgresql.id]
  db_subnet_group_name   = aws_db_subnet_group.postgresql.name
}

resource "aws_ssm_parameter" "db_host" {
  name  = "/database/host"
  type  = "String"
  value = aws_db_instance.postgresql.endpoint
}

resource "aws_ssm_parameter" "db_username" {
  name  = "/database/username"
  type  = "SecureString"
  value = var.db_username
}

resource "aws_ssm_parameter" "db_password" {
  name  = "/database/password"
  type  = "SecureString"
  value = var.db_password
}
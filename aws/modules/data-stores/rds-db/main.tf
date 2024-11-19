resource "aws_db_instance" "rds" {
  identifier_prefix = var.rds_db_prefix
  engine            = var.rds_db_engine
  allocated_storage = var.rds_db_allocated_storage
  instance_class    = var.rds_db_instance_class

  skip_final_snapshot = true

  db_name = var.rds_db_name

  username = var.rds_db_username
  password = var.rds_db_password
}
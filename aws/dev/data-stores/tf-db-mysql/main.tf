resource "aws_db_instance" "db-mysql" {
  identifier_prefix = var.tf_db_mysql_prefix
  engine            = var.tf_db_mysql_engine
  allocated_storage = var.tf_db_mysql_allocated_storage
  instance_class    = var.tf_db_mysql_instance_class

  skip_final_snapshot = true

  db_name = var.tf_db_mysql_db_name

  username = var.db_username
  password = var.db_password
}
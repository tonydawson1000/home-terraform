module "rds_db" {
  source = "../../../modules/data-stores/rds-db"

  rds_db_prefix            = var.tf_dev_db_mysql_prefix
  rds_db_engine            = var.tf_dev_db_mysql_engine
  rds_db_allocated_storage = var.tf_dev_db_mysql_allocated_storage
  rds_db_instance_class    = var.tf_dev_db_mysql_instance_class

  rds_db_name = var.tf_dev_db_mysql_db_name

  rds_db_username = var.tf_dev_db_username
  rds_db_password = var.tf_dev_db_password
}
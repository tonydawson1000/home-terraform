# Name of the AWS Region
variable "tf_region" {
  description = "The AWS Region"
  type        = string
  default     = "eu-west-2"
}

# Name of the Identifier Prefix for out AWS DB Instance
variable "tf_dev_db_mysql_prefix" {
  description = "Name of the Identifier Prefix for out AWS DB Instance"
  type        = string
  default     = "tf-dev-db-mysql-prefix"
}

# DB Engine to use
variable "tf_dev_db_mysql_engine" {
  description = "Name of the DB Engine"
  type        = string
  default     = "mysql"
}

# Storage size for DB in GB
variable "tf_dev_db_mysql_allocated_storage" {
  description = "The Storage size for DB in GB"
  type        = number
  default     = 10
}

# Instance Class (size) to use for the mysql DB
# NOTE : Discontinued -> t2.micro has 1vCPU and 1GB RAM and is part of the AWS 'Free Tier'
### AWS Free Tier
### Both db.t3.micro and db.t4g.micro instances are available in the 
### Amazon Relational Database Service (Amazon RDS) free tier. 
### New AWS customers can use these instances for up to 750 hours per month for the first 12 months.
# db.t3.micro - Both T3 and T4g are burstable general-purpose instances that can burst CPU usage at any time.
# db.t4g.micro - T4g instances use the latest AWS Graviton2 processors, which are custom-built and Arm-based.
variable "tf_dev_db_mysql_instance_class" {
  description = "Instance Class (size) to use for the mysql DB"
  type        = string
  default     = "db.t4g.micro"
}

# DB Name for mysql DB
variable "tf_dev_db_mysql_db_name" {
  description = "DB Name for mysql DB"
  type        = string
  default     = "tf_dev_my_sql_db"
}

# DB User Name
variable "tf_dev_db_username" {
  description = "Username for the DEV DB"
  type        = string
  sensitive   = true
}

# DB Password
variable "tf_dev_db_password" {
  description = "Password for the DEV DB"
  type        = string
  sensitive   = true
}
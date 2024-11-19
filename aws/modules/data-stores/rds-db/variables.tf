###
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
###

# Name of the Identifier Prefix for out AWS RDS DB Instance
variable "rds_db_prefix" {
  description = "Name of the Identifier Prefix for out AWS RDS DB Instance"
  type        = string
}

# DB Engine to use
variable "rds_db_engine" {
  description = "Name of the DB Engine"
  type        = string
}

# Storage size for DB in GB
variable "rds_db_allocated_storage" {
  description = "The Storage size for DB in GB"
  type        = number
}

# Instance Class (size) to use for the mysql DB
# NOTE : Discontinued -> t2.micro has 1vCPU and 1GB RAM and is part of the AWS 'Free Tier'
### AWS Free Tier
### Both db.t3.micro and db.t4g.micro instances are available in the 
### Amazon Relational Database Service (Amazon RDS) free tier. 
### New AWS customers can use these instances for up to 750 hours per month for the first 12 months.
# db.t3.micro - Both T3 and T4g are burstable general-purpose instances that can burst CPU usage at any time.
# db.t4g.micro - T4g instances use the latest AWS Graviton2 processors, which are custom-built and Arm-based.
variable "rds_db_instance_class" {
  description = "Instance Class (size) to use for the RDS DB"
  type        = string
}

# DB Name for RDS DB
variable "rds_db_name" {
  description = "DB Name for RDS DB"
  type        = string
}

# DB User Name
variable "rds_db_username" {
  description = "Username for the DB"
  type        = string
  sensitive   = true
}

# DB Password
variable "rds_db_password" {
  description = "Password for the DB"
  type        = string
  sensitive   = true
}
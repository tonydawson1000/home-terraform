# Name of the AWS Region
variable "tf_region" {
  description = "The AWS Region"
  type        = string
  default     = "eu-west-2"
}

variable "db_remote_state_region" {
  description = "The region for the database's remote state"
  type        = string
  default     = "eu-west-2"
}

variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket for the database's remote state"
  type        = string
  default     = "tf-remote-state-store-td-aws"
}

variable "db_remote_state_key" {
  description = "The path for the database's remote state in S3"
  type        = string
  default     = "dev/tf-db-mysql-remote-state/terraform.tfstate"
}
# You cannot use Varialbe in Remote Backend State setup
# These are here for reference only...
# Name of the AWS Region
variable "tf_region" {
  description = "The AWS Region"
  type        = string
  default     = "eu-west-2"
}

# Name of the S3 Bucket for storing Remote Terraform State
# ** THIS 'NAME' MUST BE GLOBALLY UNIQUE **
variable "tf_remote_state_s3_bucket_name" {
  description = "A unique Name for the S3 Bucket to store our Terraform Remote State"
  type        = string
  default     = "tf-remote-state-store-td-aws"
}

# Name of the DynamoDB Table for controlling Locking on the S3 Bucket
# ** THIS 'NAME' MUST BE UNIQUE IN THE AWS ACCOUNT **
variable "tf_remote_state_table_lock_name" {
  description = "The Table Name for DynamoDB to control S3 Bucket / State File Locking"
  type        = string
  default     = "tf-remote-state-store-locks"
}
###
# Security Group Vars
###

# Name for the Security Group for accepting HTTP Requests
variable "security_group_http_in_name" {
  description = "Name of the Security Group used for this VM's HTTP Inbound"
  type        = string
  default     = "tf-my-uat-security-group-http-in"
}

# Port to expose for ('security_group_http_in_name) for handling HTTP Requests
variable "server_port" {
  description = "The port the server will use for inbound HTTP requests"
  type        = number
  default     = 8095
}

###
# EC2 VM Vars
###

# Name for the EC2 VM
variable "ec2_vm_name" {
  description = "Name for the EC2 VM"
  type        = string
  default     = "tf-my-uat-ubuntu-vm"
}

###
# Remote DB State Location (so we can retreive connection details)
###

# Name of the AWS Region
variable "tf_region" {
  description = "The AWS Region"
  type        = string
  default     = "eu-west-2"
}

# Name of the S3 Bucket for storing Remote Terraform State
# ** THIS 'NAME' MUST BE GLOBALLY UNIQUE **
# This is declared and used in `backend.tf' and `backend.hcl`
variable "tf_remote_state_s3_bucket_name" {
  description = "A unique Name for the S3 Bucket to store our Terraform Remote State"
  type        = string
  default     = "tf-remote-state-store-td-aws"
}
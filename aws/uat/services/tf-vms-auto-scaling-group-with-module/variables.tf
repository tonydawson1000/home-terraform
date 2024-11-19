###
# Security Group Vars
###

# Name of the Security Group for accepting HTTP Requests (`http_port`on the external LB)
variable "security_group_http_in_lb_name" {
  description = "Name of the Security Group used on the LB"
  type        = string
  default     = "tf-my-uat-security-group-http-in-lb"
}
# Front End Port for accepting HTTP Requests at the Load Balancer
variable "http_port" {
  description = "The default port for HTTP"
  type        = number
  default     = 80
}

# Name of the Security Group for accepting HTTP Requests (`server_port` on the internal VMs)
variable "security_group_http_in_vms_name" {
  description = "Name of the Security Group used for the VMs"
  type        = string
  default     = "tf-my-uat-security-group-http-in-vms"
}
# VM Port to expose for handling HTTP Requests at the ASG/VMs
variable "server_port" {
  description = "The port the server(s) will use for inbound HTTP requests"
  type        = number
  default     = 8095
}

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
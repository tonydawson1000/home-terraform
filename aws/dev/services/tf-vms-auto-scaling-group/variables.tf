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

# VM Port to expose for handling HTTP Requests
variable "server_port" {
  description = "The port the server(s) will use for inbound HTTP requests"
  type        = number
  default     = 8080
}

# Front End Port for accepting HTTP Requests at the Load Balancer
variable "http_port" {
  description = "The default port for HTTP"
  type        = number
  default     = 80
}

# Name of the Security Group for accepting HTTP 80 Requests (on the external LB)
variable "security_group_http_in_lb_80_name" {
  description = "Name of the Security Group used on the LB"
  type        = string
  default     = "tf-security-group-http-in-lb-80"
}

# Name of the Security Group for accepting HTTP 8080 Requests (on the internal VMs)
variable "security_group_http_in_vms_8080_name" {
  description = "Name of the Security Group used for the VMs"
  type        = string
  default     = "tf-security-group-http-in-vms-8080"
}

# Name of the Auto Scaling Group
variable "auto_scaling_group_name" {
  description = "Name of the Auto Scaling Group used to Manage the VMs"
  type        = string
  default     = "tf-asg-ubuntu-20-04"
}

# Name of the Application Load Balancer
variable "load_balancer_name" {
  description = "Name of the Load Balancer used as a single point into the ASG Cluster"
  type        = string
  default     = "tf-lb-ubuntu-20-04"
}

# Name of the Application Load Balancer Target Group
variable "load_balancer_target_group_name" {
  description = "Name of the Load Balancer Target Group"
  type        = string
  default     = "tf-lb-target-group-ubuntu-20-04"
}
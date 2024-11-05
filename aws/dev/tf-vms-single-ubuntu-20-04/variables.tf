# VM Port to expose for handling HTTP Requests
variable "server_port" {
  description = "The port the server will use for inbound HTTP requests"
  type        = number
  default     = 8080
}

# Name of the Security Group for accepting HTTP 8080 Requests
variable "security_group_http_in_8080_name" {
  description = "Name of the Security Group used for Single VM"
  type        = string
  default     = "tf-security-group-http-in-8080"
}

# Name of the Single EC2 Ubuntu 20.04 VM
variable "ec2_ubuntu_20_04_vm_name" {
  description = "Name of the Ubuntu 20.04 EC2 VM"
  type        = string
  default     = "tf-ubuntu-22-04"
}
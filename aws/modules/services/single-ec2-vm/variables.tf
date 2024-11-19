###
# REQUIRED PARAMETERS - EC2 Instance
# You must provide a value for each of these parameters.
###

# AWS EC2 Name of the VM
variable "ec2_vm_name" {
  description = "Name of the EC2 VM"
  type        = string
}

# DB Details
variable "db_address" {
  description = "Endpoint Address of the RDS DB to connect to"
  type        = string
}

variable "db_port" {
  description = "Endpoint Port of the RDS DB to connect to"
  type        = number
}

###
# OPTIONAL PARAMETERS - Security Group
# These parameters have reasonable defaults.
###

# Name of the Security Group for accepting HTTP Requests
variable "security_group_http_in_name" {
  description = "Name of the Security Group used for Single VM"
  type        = string
  default     = "tf-security-group-http-in"
}

# VM Port to expose for handling HTTP Requests
variable "server_port" {
  description = "The port the server will use for inbound HTTP requests"
  type        = number
  default     = 8090
}

###
# OPTIONAL PARAMETERS - EC2 Instance
# These parameters have reasonable defaults.
###

# AWS EC2 AMI Instance Id for VM
variable "ami_instance_id" {
  description = "The AMI of VM to use"
  type        = string
  default     = "ami-03ceeb33c1e4abcd1"
}

# AWS EC2 AMI Instance 'type' / size for VM (e.g. t2.micro)
variable "ami_instance_type" {
  description = "The AMI Instance 'type' / size to use"
  type        = string
  default     = "t2.micro"
}
###
# REQUIRED PARAMETERS - EC2 (Launch Template)
# You must provide a value for each of these parameters.
###

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
# REQUIRED PARAMETERS - EC2 (ASG)
# You must provide a value for each of these parameters.
###

# Name of the Auto Scaling Group
variable "auto_scaling_group_name" {
  description = "Name of the Auto Scaling Group used to Manage the VMs"
  type        = string
}

variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  type        = number
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  type        = number
}

variable "desired_capacity" {
  description = "The number of EC2 instances that should be running in the group"
  type        = number
}

###
# REQUIRED PARAMETERS - EC2 (LB)
# You must provide a value for each of these parameters.
###

# Name of the Application Load Balancer
variable "load_balancer_name" {
  description = "Name of the Load Balancer used as a single point into the ASG Cluster"
  type        = string
}

# Name of the Application Load Balancer Target Group
variable "load_balancer_target_group_name" {
  description = "Name of the Load Balancer Target Group"
  type        = string
}

###
# OPTIONAL PARAMETERS - Security Group
# These parameters have reasonable defaults.
###

# Name of the Security Group for accepting HTTP Requests (`http_port`on the external LB)
variable "security_group_http_in_lb_name" {
  description = "Name of the Security Group used on the LB"
  type        = string
  default     = "tf-security-group-http-in-lb"
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
  default     = "tf-security-group-http-in-vms"
}
# VM Port to expose for handling HTTP Requests at the ASG/VMs
variable "server_port" {
  description = "The port the server(s) will use for inbound HTTP requests"
  type        = number
  default     = 8080
}

###
# OPTIONAL PARAMETERS - EC2 (Launch Template)
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
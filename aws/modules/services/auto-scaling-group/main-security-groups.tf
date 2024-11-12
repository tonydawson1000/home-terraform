###
# Deploy an Auto Scaling Group of Web Server(s)
# Create Resources
# 1. aws_security_group - for EC2 - Set up Firewall Rules (In HTTP `server_port` / Out NONE)
# 2. aws_security_group - for LB - Set up Firewall Rules (In HTTP `http_port` / Out ALL)
###

###
# Security Group - for setting Firewall Rules for VMs in ASG (`server_port`)
###
resource "aws_security_group" "sg-asg-vms" {
  name = var.security_group_http_in_vms_name

  # Allow inbound HTTP requests on `server_port`
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = local.tcp_protocol
    cidr_blocks = local.all_ips
  }
}

###
# Security Group - for setting Firewall Rules for LB (`http_port`)
###
resource "aws_security_group" "sg-asg-lb" {
  name = var.security_group_http_in_lb_name

  # Allow inbound HTTP requests on `http_port`
  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = local.tcp_protocol
    cidr_blocks = local.all_ips
  }

  # Allow all outbound requests
  egress {
    from_port   = local.any_port
    to_port     = local.any_port
    protocol    = local.any_protocol
    cidr_blocks = local.all_ips
  }
}
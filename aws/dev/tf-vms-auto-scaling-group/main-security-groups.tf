###
# Deploy an Auto Scaling Group of Web Server(s)
# Create Resources
# 1. aws_security_group - for EC2 - Set up Firewall Rules (In HTTP 8080 / Out NONE)
# 2. aws_security_group - for LB - Set up Firewall Rules (In HTTP 80 / Out ALL)
###

###
# Security Group - for setting Firewall Rules (8080) for VMs in ASG
###
resource "aws_security_group" "sg-asg-ubuntu-20-04-in-8080" {
  name = var.security_group_http_in_vms_8080_name

  # Allow inbound HTTP requests on 8080
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

###
# Security Group - for setting Firewall Rules (80) for LB
###
resource "aws_security_group" "sg-asg-ubuntu-20-04-in-80" {
  name = var.security_group_http_in_lb_80_name

  # Allow inbound HTTP requests on 80
  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound requests
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
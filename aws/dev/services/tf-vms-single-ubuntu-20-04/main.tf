###
# Deploy a Single Web Server
# Create 2 Resource
# 1. aws_security_group - Set up Firewall Rules (In HTTP 8080 / Out none)
# 2. aws_instance       - Single EC2 (VM) - Ubuntu 20.04 - t2.micro
#                       - Attached to the aws_security_group (firewall)
###

###
# Security Group - for setting Firewall Rules for VM
###
resource "aws_security_group" "sg-single-ec2-ubuntu-20-04" {
  name = var.security_group_http_in_8080_name

  # Allow inbound HTTP requests on 8080
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

###
# Single EC2 instance (VM)
###
resource "aws_instance" "ami-ubuntu-20-04" {
  ami           = "ami-03ceeb33c1e4abcd1"
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.sg-single-ec2-ubuntu-20-04.id]

  # Render the User Data script as a Template
  user_data = base64encode(templatefile("scripts/user-data.sh", {
    server_port = var.server_port
    db_address  = data.terraform_remote_state.mysqldb.outputs.db_address
    db_port     = data.terraform_remote_state.mysqldb.outputs.db_port
  }))

  user_data_replace_on_change = true

  tags = {
    Name = var.ec2_ubuntu_20_04_vm_name
  }
}
###
# Deploy a Single EC2 VM Web Server
# Create 2 Resource
# 1. aws_security_group - Set up Firewall Rules (In HTTP `var.server_port` / Out none)
# 2. aws_instance       - Single EC2 (VM) - AMI passed in - size passed in
#                       - Attached to the aws_security_group (firewall)
###

###
# Security Group - for setting Firewall Rules for VM
###
resource "aws_security_group" "sg-single-ec2-vm" {
  name = var.security_group_http_in_name

  # Allow inbound HTTP requests on `var.server_port`
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = local.tcp_protocol
    cidr_blocks = local.all_ips
  }
}

###
# Single EC2 instance (VM)
###
resource "aws_instance" "single-ec2-vm" {
  ami           = var.ami_instance_id
  instance_type = var.ami_instance_type

  vpc_security_group_ids = [aws_security_group.sg-single-ec2-vm.id]

  # Render the User Data script as a Template
  user_data = base64encode(templatefile("${path.module}/scripts/user-data.sh", {
    ami_instance_id   = var.ami_instance_id
    ami_instance_type = var.ami_instance_type

    db_address = var.db_address
    db_port    = var.db_port

    server_port = var.server_port
  }))

  user_data_replace_on_change = true

  tags = {
    Name = var.ec2_vm_name
  }
}
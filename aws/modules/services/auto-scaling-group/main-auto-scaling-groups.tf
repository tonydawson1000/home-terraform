###
# Deploy an Auto Scaling Group of Web Server(s)
# Create Resources
# ...
# 3. aws_launch_template - Config for the EC2 Instances used in the ASG
# 4. aws_autoscaling_group - Used to Launch, Monitor and Manage a 'Cluster' of EC2 VMs
###

###
# Launch Template - Config for the EC2 Instances used in the ASG
# create_before_destroy - creates the replacement first - then deletes the old
# Uses Security Group to allow HTTP `server_port` in to EC2 VMs in ASG
###
resource "aws_launch_template" "lt-asg-vms" {
  image_id      = var.ami_instance_id
  instance_type = var.ami_instance_type

  vpc_security_group_ids = [aws_security_group.sg-asg-vms.id]

  # Render the User Data script as a Template
  user_data = base64encode(templatefile("${path.module}/scripts/user-data.sh", {
    ami_instance_id   = var.ami_instance_id
    ami_instance_type = var.ami_instance_type

    db_address = data.terraform_remote_state.mysqldb.outputs.db_address
    db_port    = data.terraform_remote_state.mysqldb.outputs.db_port

    server_port = var.server_port
  }))

  # Required when using a launch configuration with an auto scaling group.
  lifecycle {
    create_before_destroy = true
  }
}

###
# Auto Scaling Group - Used to Launch, Monitor and Manage a 'Cluster' of EC2 VMs
###
resource "aws_autoscaling_group" "asg" {
  launch_template {
    id = aws_launch_template.lt-asg-vms.id
  }

  vpc_zone_identifier = data.aws_subnets.default.ids

  target_group_arns = [aws_lb_target_group.lb-targets-asg.arn]
  health_check_type = "ELB"

  min_size = var.min_size
  max_size = var.max_size

  desired_capacity = var.desired_capacity

  tag {
    key                 = "Name"
    value               = var.auto_scaling_group_name
    propagate_at_launch = true
  }
}
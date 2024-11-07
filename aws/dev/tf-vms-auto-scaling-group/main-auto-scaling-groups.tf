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
# Uses Security Group to allow HTTP 8080 in
###
resource "aws_launch_template" "lt-asg-ubuntu-20-04" {
  image_id               = "ami-03ceeb33c1e4abcd1"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg-asg-ubuntu-20-04-in-8080.id]

  user_data = base64encode(templatefile("scripts/user-data.sh", {
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
resource "aws_autoscaling_group" "asg-ubuntu-20-04" {
  launch_template {
    id = aws_launch_template.lt-asg-ubuntu-20-04.id
  }

  vpc_zone_identifier = data.aws_subnets.default.ids

  target_group_arns = [aws_lb_target_group.lb-targets-asg-ubuntu-20-04.arn]
  health_check_type = "ELB"

  min_size = 2
  max_size = 5

  tag {
    key                 = "Name"
    value               = var.auto_scaling_group_name
    propagate_at_launch = true
  }
}
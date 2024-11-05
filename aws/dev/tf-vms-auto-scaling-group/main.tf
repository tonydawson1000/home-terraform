###
# Deploy an Auto Scaling Group of Web Server(s)
# Create XX Resources
# 1. aws_security_group - for EC2 - Set up Firewall Rules (In HTTP 8080 / Out NONE)
# 2. aws_security_group - for LB - Set up Firewall Rules (In HTTP 80 / Out ALL)
# 3. aws_launch_template - Config for the EC2 Instances used in the ASG
# 4. aws_autoscaling_group - Used to Launch, Monitor and Manage a 'Cluster' of EC2 VMs
# 5. aws_lb - Application Load Balancer - Used to provide a Single Entry to the ASG Cluster
# 6. aws_lb_listener - Configures the LB to 'listen' for specified requests (e.g. HTTP 80)
# 7. aws_lb_target_group - Configures where the LB sends matching Rules to + Simple Health Checks
# 8. aws_lb_listener_rule - Configures the Rule(s) for the LB

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

###
# Application Load Balancer (ALB)
# Requires a Security Group (Firewall)
# Requires a LB Listener (to receive requests)
# Requires a LB Target Group (to forward requests onto)
###
resource "aws_lb" "lb-asg-ubuntu-20-04" {
  name               = var.load_balancer_name
  load_balancer_type = "application"
  subnets            = data.aws_subnets.default.ids
  security_groups    = [aws_security_group.sg-asg-ubuntu-20-04-in-80.id]
}
###
# Load Balancer Listner (lb_listener)
# Sets a 'Default' response (if no rule matches)
###
resource "aws_lb_listener" "lb-listener-http" {
  load_balancer_arn = aws_lb.lb-asg-ubuntu-20-04.arn
  port              = var.http_port
  protocol          = "HTTP"

  # By default, return a simple 404 page
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code  = 404
    }
  }
}
###
# Target Group the Requests from the LB should be forward onto
# Includes a simple Health Check
###
resource "aws_lb_target_group" "lb-targets-asg-ubuntu-20-04" {
  name     = var.load_balancer_target_group_name
  port     = var.server_port
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}
###
# LB Listener Rule to forward HTTP :80 Requests on to Ubuntu 20.04 
###
resource "aws_lb_listener_rule" "lb-listener-rule-ubuntu-20-04" {
  listener_arn = aws_lb_listener.lb-listener-http.arn
  priority     = 100

  condition {
    path_pattern {
      values = ["*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb-targets-asg-ubuntu-20-04.arn
  }
}
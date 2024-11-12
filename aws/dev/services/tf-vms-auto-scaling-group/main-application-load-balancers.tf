###
# Deploy an Auto Scaling Group of Web Server(s)
# Create Resources
# ...
# 5. aws_lb - Application Load Balancer - Used to provide a Single Entry to the ASG Cluster
# 6. aws_lb_listener - Configures the LB to 'listen' for specified requests (e.g. HTTP 80)
# 7. aws_lb_target_group - Configures where the LB sends matching Rules to + Simple Health Checks
# 8. aws_lb_listener_rule - Configures the Rule(s) for the LB
###

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
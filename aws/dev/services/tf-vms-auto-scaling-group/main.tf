###
# Deploy an Auto Scaling Group of Web Server(s)
# Create Resources
# 1. aws_security_group - for EC2 - Set up Firewall Rules (In HTTP 8080 / Out NONE)
# 2. aws_security_group - for LB - Set up Firewall Rules (In HTTP 80 / Out ALL)

# 3. aws_launch_template - Config for the EC2 Instances used in the ASG
# 4. aws_autoscaling_group - Used to Launch, Monitor and Manage a 'Cluster' of EC2 VMs

# 5. aws_lb - Application Load Balancer - Used to provide a Single Entry to the ASG Cluster
# 6. aws_lb_listener - Configures the LB to 'listen' for specified requests (e.g. HTTP 80)
# 7. aws_lb_target_group - Configures where the LB sends matching Rules to + Simple Health Checks
# 8. aws_lb_listener_rule - Configures the Rule(s) for the LB
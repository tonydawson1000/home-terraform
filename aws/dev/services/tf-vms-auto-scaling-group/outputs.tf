###
# Public DNS of the Application Load Balancer fronting the Auto Scaling Group (ASG) of VMs (EC2)
###
output "lb_public_dns" {
  value       = aws_lb.lb-asg-ubuntu-20-04.dns_name
  description = "The public DNS of the web server"
}
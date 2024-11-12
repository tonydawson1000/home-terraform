###
# Public DNS of the Application Load Balancer fronting the Auto Scaling Group (ASG) of VMs (EC2)
###
output "lb_public_dns" {
  value       = aws_lb.lb-asg-vms.dns_name
  description = "The public DNS of the Load Balancers"
}

output "asg_name" {
  value       = aws_autoscaling_group.asg.name
  description = "The name of the Auto Scaling Group"
}

output "alb_security_group_id" {
  value       = aws_security_group.sg-asg-lb.id
  description = "The ID of the Security Group attached to the load balancer"
}
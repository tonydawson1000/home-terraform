###
# Public DNS of the Application Load Balancer fronting the Auto Scaling Group (ASG) of VMs (EC2)
###
output "lb_public_dns" {
  value       = module.asg.lb_public_dns
  description = "The public DNS of the Load Balancers"
}

output "asg_name" {
  value       = module.asg.asg_name
  description = "The name of the Auto Scaling Group"
}

output "alb_security_group_id" {
  value       = module.asg.alb_security_group_id
  description = "The ID of the Security Group attached to the load balancer"
}
###
# Public DNS and Public IP of Single EC2 (VM)
###
output "public_dns" {
  value       = module.single_ec2_vm.public_dns
  description = "The public DNS of the EC2 VM"
}

output "public_ip" {
  value       = module.single_ec2_vm.public_ip
  description = "The public IP address of the EC2 VM"
}

output "server_port" {
  value       = module.single_ec2_vm.server_port
  description = "The Inbound HTTP Port exposed in the Security Group"
}
###
# Public DNS and Public IP of Single EC2 (VM)
###
output "public_dns" {
  value       = aws_instance.single-ec2-vm.public_dns
  description = "The public DNS of the EC2 VM"
}

output "public_ip" {
  value       = aws_instance.single-ec2-vm.public_ip
  description = "The public IP address of the EC2 VM"
}
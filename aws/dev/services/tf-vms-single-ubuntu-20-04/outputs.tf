###
# Public DNS and Public IP of Single EC2 (VM)
###
output "public_dns" {
  value       = aws_instance.ami-ubuntu-20-04.public_dns
  description = "The public DNS of the web server"
}

output "public_ip" {
  value       = aws_instance.ami-ubuntu-20-04.public_ip
  description = "The public IP address of the web server"
}

output "server_port" {
  value       = var.server_port
  description = "The Inbound HTTP Port exposed in the Security Group"
}

output "http_endpoint" {
  value       = "${aws_instance.ami-ubuntu-20-04.public_dns}:${var.server_port}"
  description = "Complete Endpoint URL inc Port for HTTP"
}
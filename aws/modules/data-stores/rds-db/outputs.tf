output "address" {
  value       = aws_db_instance.rds.address
  description = "Connect to the rds db at this endpoint"
}

output "port" {
  value       = aws_db_instance.rds.port
  description = "Connect to the rds db on this port"
}
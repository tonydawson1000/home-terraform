output "db_address" {
  value       = aws_db_instance.db-mysql.address
  description = "Connect to the mysql db at this endpoint"
}

output "db_port" {
  value       = aws_db_instance.db-mysql.port
  description = "Connect to the msql db on this port"
}
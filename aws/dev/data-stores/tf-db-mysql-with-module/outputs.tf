output "db_address" {
  value       = module.rds_db.address
  description = "Connect to the rds db at this endpoint"
}

output "db_port" {
  value       = module.rds_db.port
  description = "Connect to the rds db on this port"
}
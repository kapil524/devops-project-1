output "rds_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = aws_db_instance.default.endpoint
}

output "rds_address" {
  description = "The hostname of the RDS instance"
  value       = aws_db_instance.default.address
}

output "rds_port" {
  description = "The port of the RDS instance"
  value       = aws_db_instance.default.port
}

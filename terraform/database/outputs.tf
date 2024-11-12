output "endpoint" {
  description = "The db instance endpoint"
  value       = module.postgres.db_instance_address
}

output "port" {
  description = "The db instance port"
  value       = module.postgres.db_instance_port
}

output "db_name" {
  description = "The database name"
  value       = module.postgres.db_instance_name
}

output "username" {
  description = "The db master username"
  value       = module.postgres.db_instance_username
  sensitive   = true
}

output "password" {
  description = "The db master password"
  value       = local.postgres_password
  sensitive   = true
}

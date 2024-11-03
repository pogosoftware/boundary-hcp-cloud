output "endpoint" {
  value = module.postgres.db_instance_address
}

output "port" {
  value = module.postgres.db_instance_port
}

output "db_name" {
  value = module.postgres.db_instance_name
}

output "username" {
  value = module.postgres.db_instance_username
  sensitive = true
}

output "password" {
  value = local.postgres_password
  sensitive = true
}
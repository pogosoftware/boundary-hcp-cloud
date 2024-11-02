# provider "postgresql" {
#   host            = module.postgres.db_instance_address
#   port            = module.postgres.db_instance_port
#   database        = module.postgres.db_instance_name
#   username        = module.postgres.db_instance_username
#   password        = local.postgres_password
#   sslmode         = "require"
#   connect_timeout = 15
# }
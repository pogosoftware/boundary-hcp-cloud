locals {
  vault_private_endpoint_url = data.terraform_remote_state.hcp_cloud.outputs.hcp_vault_private_endpoint_url

  # boundary
  boundary_username = data.terraform_remote_state.hcp_cloud.outputs.hcp_boundary_username
  boundary_password = data.terraform_remote_state.hcp_cloud.outputs.hcp_boundary_password

  # database
  database_endpoint = data.terraform_remote_state.database.outputs.endpoint
  database_port     = data.terraform_remote_state.database.outputs.port
  database_db_name  = data.terraform_remote_state.database.outputs.db_name
  database_username = data.terraform_remote_state.database.outputs.username
  database_password = data.terraform_remote_state.database.outputs.password
}

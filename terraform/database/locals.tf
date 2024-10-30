locals {
  identifier = format("%s-%s", var.database_identifier_prefix, var.environment)

  postgres_username = random_string.postgres_username.result
  postgres_password = random_password.postgres_password.result

  postgres_subnet_id = data.terraform_remote_state.network.outputs.public_subnet_ids
  postrgres_sg_id    = data.terraform_remote_state.network.outputs.security_group_ids["database"]
}

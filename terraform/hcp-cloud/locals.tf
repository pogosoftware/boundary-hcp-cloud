locals {
  vault_cluster_id    = format("%s-%s", var.vault_cluster_id, var.environment)
  boundary_cluster_id = format("%s-%s", var.boundary_cluster_id, var.environment)

  # boundary
  boundary_username = random_string.boundary_username.result
  boundary_password = random_password.boundary_password.result

  # aws peering
  peering_id              = format("%s-peering-%s", var.peering_id, var.environment)
  route_id                = format("%s-hvn-%s", var.route_id, var.environment)
}


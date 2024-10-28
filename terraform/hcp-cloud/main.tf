# ####################################################################################################
# ### HCP VAULT CLUSTER
# ####################################################################################################
resource "hcp_hvn" "this" {
  hvn_id         = var.hcp_cloud_hvn_id
  cloud_provider = var.hcp_cloud_cloud_provider
  region         = var.hcp_cloud_region
  cidr_block     = var.hcp_cloud_cidr_block
}

resource "hcp_vault_cluster" "this" {
  cluster_id      = local.vault_cluster_id
  hvn_id          = hcp_hvn.this.hvn_id
  public_endpoint = var.vault_public_endpoint
  tier            = var.vault_tier
}

resource "hcp_vault_cluster_admin_token" "this" {
  cluster_id = hcp_vault_cluster.this.cluster_id
}

####################################################################################################
### HCP BOUNDARY CLUSTER
####################################################################################################
resource "random_string" "boundary_username" {
  length  = 16
  special = false
  upper   = false
}

resource "random_password" "boundary_password" {
  length           = 32
  special          = true
  override_special = "/@£$"
}

resource "hcp_boundary_cluster" "this" {
  cluster_id = local.boundary_cluster_id
  username   = local.boundary_username
  password   = local.boundary_password
  tier       = var.boundary_tier
}

####################################################################################################
### HCP -> AWS PEERING
####################################################################################################
resource "hcp_aws_network_peering" "peer" {
  hvn_id          = hcp_hvn.this.hvn_id
  peering_id      = local.peering_id
  peer_vpc_id     = var.peer_vpc_id
  peer_account_id = var.peer_account_id
  peer_vpc_region = var.peer_vpc_region
}

resource "hcp_hvn_route" "peer_route" {
  hvn_link         = hcp_hvn.this.self_link
  hvn_route_id     = local.route_id
  destination_cidr = var.peer_destination_cidr
  target_link      = hcp_aws_network_peering.peer.self_link
}

resource "aws_vpc_peering_connection_accepter" "peer" {
  vpc_peering_connection_id = hcp_aws_network_peering.peer.provider_peering_id
  auto_accept               = true
  tags = {
    Name = local.peering_id
  }
}

resource "aws_route" "private_to_hvn" {
  for_each = var.private_route_table_ids

  route_table_id            = each.key
  destination_cidr_block    = var.hcp_cloud_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.peer.vpc_peering_connection_id
}

resource "hcp_vault_secrets_app" "boundary" {
  app_name    = "boundary"
  description = "HCP Boundry secrets"
}

resource "hcp_vault_secrets_secret" "boundary_username" {
  app_name     = hcp_vault_secrets_app.boundary.app_name
  secret_name  = "username"
  secret_value = local.boundary_username
}

resource "hcp_vault_secrets_secret" "boundary_password" {
  app_name     = hcp_vault_secrets_app.boundary.app_name
  secret_name  = "password"
  secret_value = local.boundary_password
}

provider "vault" {
  address = local.vault_address
  token   = hcp_vault_cluster_admin_token.this.token
}

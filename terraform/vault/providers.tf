provider "vault" {
  address          = local.vault_private_endpoint_url
  skip_child_token = true
}

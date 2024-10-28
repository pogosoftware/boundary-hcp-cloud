####################################################################################################
### SSH KEYS
####################################################################################################
resource "tls_private_key" "vault" {
  algorithm = "ED25519"
}

####################################################################################################
### VAULT SSH RESOURCES
####################################################################################################
resource "vault_mount" "ssh" {
  path = var.vault_ssh_mount_path
  type = "ssh"
}

resource "vault_ssh_secret_backend_ca" "ssh" {
  backend              = vault_mount.ssh.path
  generate_signing_key = false
  public_key           = tls_private_key.vault.public_key_openssh
  private_key          = tls_private_key.vault.private_key_openssh
}

resource "vault_policy" "boundary_controller" {
  name = "boundary-controller"

  policy = file("templates/boundary-controller-policy.hcl")
}

resource "vault_policy" "ssh" {
  name = "ssh"

  policy = templatefile("templates/ssh-policy.hcl", {
    vault_ssh_mount_path = var.vault_ssh_mount_path,
    vault_ssh_role_name  = var.vault_ssh_role_name
  })
}

resource "vault_ssh_secret_backend_role" "boundary_client" {
  name                    = var.vault_ssh_role_name
  backend                 = vault_mount.ssh.path
  key_type                = "ca"
  allow_user_certificates = true
  default_user            = var.vault_ssh_default_user
  default_extensions = {
    "permit-pty" : ""
  }
  allowed_users      = "*"
  allowed_extensions = "*"
}

resource "vault_token" "boundary" {
  no_default_policy = true
  policies          = ["boundary-controller", "ssh"]
  no_parent         = true
  period            = "24h"
  renewable         = true
}

resource "hcp_vault_secrets_secret" "boundary_vault_token" {
  app_name     = data.hcp_vault_secrets_app.boundary.app_name
  secret_name  = "vault_token"
  secret_value = vault_token.boundary.client_token
}

resource "hcp_vault_secrets_secret" "boundary_vault_ca_public_key_openssh" {
  app_name     = data.hcp_vault_secrets_app.boundary.app_name
  secret_name  = "vault_ca_public_key_openssh"
  secret_value = tls_private_key.vault.public_key_openssh
}

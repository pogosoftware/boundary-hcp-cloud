####################################################################################################
### GLOBAL
####################################################################################################
variable "bootstrap_workspace_name" {
  description = "The name of bootstrap workspace"
  type        = string
}

####################################################################################################
### VAULT
####################################################################################################
variable "vault_ssh_mount_path" {
  default     = "ssh-client-signer"
  description = "The path to SSH Vault mount"
  type        = string
}

variable "vault_ssh_role_name" {
  default     = "boundary-client"
  description = "The name of SSH backend role"
  type        = string
}

variable "vault_ssh_default_user" {
  default     = "ubuntu"
  description = "The SSH default user name"
  type        = string
}

variable "vault_apps_mount_name" {
  default     = "apps"
  description = "The name of Vault mount for apps"
  type        = string
}

variable "vault_apps_boundary_secret_name" {
  default     = "infra/boundary"
  description = "The name of boundary secret in vault"
  type        = string
}

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

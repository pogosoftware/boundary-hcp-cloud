####################################################################################################
### HCP BOUNDARY
####################################################################################################
output "hcp_boundary_cluster_id" {
  description = "The ID of HCP Boundary cluster"
  value       = join("", regex("https://([a-f0-9-]+)\\.boundary\\.hashicorp\\.cloud", hcp_boundary_cluster.this.cluster_url))
}

output "hcp_boundary_cluster_url" {
  description = "The URL to HCP Boundary"
  value       = hcp_boundary_cluster.this.cluster_url
}

output "hcp_boundary_username" {
  description = "The name of HCP Boundary"
  value       = local.boundary_username
}

output "hcp_boundary_password" {
  description = "The name of HCP Boundary"
  value       = local.boundary_password
  sensitive   = true
}

####################################################################################################
### HCP VAULT
####################################################################################################
output "hcp_vault_private_endpoint_url" {
  description = "The private URL to HCP Vault cluster"
  value       = hcp_vault_cluster.this.vault_private_endpoint_url
}

output "hcp_vault_public_endpoint_url" {
  description = "The public URL to HCP Vault cluster"
  value       = hcp_vault_cluster.this.vault_public_endpoint_url
}

output "hcp_vault_admin_token" {
  value     =  hcp_vault_cluster_admin_token.this.token
  sensitive = true
}


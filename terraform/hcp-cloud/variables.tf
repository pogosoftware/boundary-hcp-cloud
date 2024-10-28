####################################################################################################
### GLOBAL
####################################################################################################
variable "environment" {
  description = "The Name of environment. Possible values are: `dev`, `stg`, `prd`"
  type        = string
}

####################################################################################################
### HCP CLOUD
####################################################################################################
variable "hcp_project_id" {
  description = "The UUID of HCP project"
  type        = string
}

####################################################################################################
### HCP VAULT CLUSTER
####################################################################################################
variable "hcp_cloud_hvn_id" {
  default     = "hvn"
  description = "The name of hvn network"
  type        = string
}

variable "hcp_cloud_cloud_provider" {
  default     = "aws"
  description = "The name of cloud provider"
  type        = string
}

variable "hcp_cloud_region" {
  default     = "eu-central-1"
  description = "The name of region where hvn will network be created"
  type        = string
}

variable "hcp_cloud_cidr_block" {
  default     = "172.25.16.0/20"
  description = "The CIDR of hvn network"
  type        = string
}

variable "vault_cluster_id" {
  default     = "sefapass-sentinel"
  description = "The name of Valut cluster"
  type        = string
}

variable "vault_public_endpoint" {
  default     = false
  description = "Determinates to set public endpoint or not"
  type        = bool
}

variable "vault_tier" {
  default     = "dev"
  description = "The name of Vault tier"
  type        = string
}

####################################################################################################
### HCP BOUNDARY CLUSTER
####################################################################################################
variable "boundary_cluster_id" {
  default     = "safepass-sentinel"
  description = "The ID of the Boundary cluster"
  type        = string
}

variable "boundary_tier" {
  default     = "Standard"
  description = "The tier that the HCP Boundary cluster will be provisioned as, 'Standard' or 'Plus'"
  type        = string
}

####################################################################################################
### HCP -> AWS PEERING
####################################################################################################
variable "peering_id" {
  default     = "safepass-sentinel"
  description = "The ID of the network peering"
  type        = string
}

variable "route_id" {
  default     = "safepass-sentinel"
  description = "The ID of the HVN route"
  type        = string
}

variable "peer_vpc_id" {
  type = string
}

variable "peer_account_id" {
  type = string
}

variable "peer_destination_cidr" {
  type = string
}

variable "peer_vpc_region" {
  type = string
}

variable "private_route_table_ids" {
  type = set(string)
}

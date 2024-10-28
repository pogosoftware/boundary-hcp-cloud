variable "aws_region" {
  type      = string
  sensitive = false
}

variable "identity_token" {
  type      = string
  ephemeral = true
}

variable "role_arn" {
  type      = string
  ephemeral = true
}

variable "default_tags" {
  type = map(string)
}

variable "environment" {
  type = string
}

variable "hcp_project_id" {
  type = string
}

variable "hcp_token" {
  type      = string
  ephemeral = true
}

variable "tfe_token" {
  type      = string
  ephemeral = true
  sensitive = true
}

variable "hcp_workload_identity_provider" {
  type      = string
  ephemeral = true
}

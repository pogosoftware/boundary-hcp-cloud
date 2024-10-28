variable "aws_region" {
  type      = string
  sensitive = false
  ephemeral = true
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
  type      = string
  ephemeral = true
}

variable "hcp_project_id" {
  type      = string
  ephemeral = true
}

variable "hcp_token" {
  type      = string
  ephemeral = true
}

variable "hcp_workload_identity_provider" {
  type      = string
  ephemeral = true
}

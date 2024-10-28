required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "5.73.0"
  }
  hcp = {
    source  = "hashicorp/hcp"
    version = "0.97.0"
  }
  random = {
    source  = "hashicorp/random"
    version = "3.6.3"
  }
  vault = {
    source  = "hashicorp/vault"
    version = "4.4.0"
  }
  tls = {
    source  = "hashicorp/tls"
    version = "4.0.6"
  }
  boundary = {
    source  = "hashicorp/boundary"
    version = "1.2.0"
  }
  tfe = {
    source  = "hashicorp/tfe"
    version = "0.59.0"
  }
}

provider "aws" "develop" {
  config {
    region = var.aws_region

    assume_role_with_web_identity {
      role_arn           = var.role_arn
      web_identity_token = var.identity_token
    }

    default_tags {
      tags = var.default_tags
    }
  }
}

provider "hcp" "this" {
  config {
    project_id = var.hcp_project_id

    workload_identity {
      resource_name = var.hcp_workload_identity_provider
      token         = var.hcp_token
    }
  }
}

provider "vault" "this" {
  config {
    address = component.hcp_cloud.hcp_vault_private_endpoint_url
    token   = component.hcp_cloud.hcp_vault_admin_token
  }
}

// provider "boundary" "this" {
//   config {
//     addr                   = component.hcp_cloud.hcp_boundary_cluster_url
//     auth_method_login_name = component.hcp_cloud.hcp_boundary_username
//     auth_method_password   = component.hcp_cloud.hcp_boundary_password
//   }
// }

provider "tfe" "this" {
  config {
    token = var.tfe_token
  }
}

provider "random" "this" {}
provider "tls" "this" {}
